class SpendingsController < ApplicationController
  before_action :set_spending, only: %i[show update destroy]

  # GET /spendings
  def index
    @spendings = Spending.all
    respond_to do |format|
      format.html # This is for regular HTML requests
      format.turbo_stream # This is for Turbo Stream updates
    end

    # Get month and year from params or use the current date
    @month = (params[:month] || Time.now.month).to_i
    @year = (params[:year] || Time.now.year).to_i

    # Compute first and last days of the requested month
    first_day = Date.new(@year, @month, 1)
    last_day = first_day.end_of_month

    # Fetch spending records for the month
    spending_records = Spending.where(created_at: first_day..last_day)

    # Prepare daily totals
    days_in_month = last_day.day
    @daily_totals = Array.new(days_in_month, 0.0)

    spending_records.each do |record|
      day = record.created_at.day
      @daily_totals[day - 1] += record.price
    end
  end

  # GET /daily
  def daily
    # Fetch all spending records for the specified date
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @spendings = Spending.where(date_time_utc: @date.beginning_of_day..@date.end_of_day)

    respond_to do |format|
      format.html # For regular HTML requests
      format.turbo_stream # For Turbo Stream updates
      format.json { render json: @spendings } # Optional JSON response for APIs
    end
  end
  # GET /spendings/:id
  def show
    render json: @spending
  end

  # POST /spendings
  def create
    @spending = Spending.new(spending_params)
    if @spending.save
      respond_to do |format|
        format.html { redirect_to spendings_path, notice: "Spending was successfully created." }
        format.turbo_stream # Turbo stream will handle the response for dynamic updates
      end
    else
      render json: @spending.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /spendings/:id
  def update
    if @spending.update(spending_params)
      respond_to do |format|
        format.html { redirect_to @spending, notice: "Spending was successfully updated." }
        format.turbo_stream # Turbo stream will update the item dynamically
      end
    else
      render json: @spending.errors, status: :unprocessable_entity
    end
  end

  # DELETE /spendings/:id
  def destroy
    @spending.destroy
    respond_to do |format|
      format.html { redirect_to spendings_url, notice: "Spending was successfully destroyed." }
      format.turbo_stream # Turbo stream will remove the item from the list
    end
  end

  private

  def set_spending
    @spending = Spending.find(params[:id])
  end

  def spending_params
    params.require(:spending).permit(:name, :price, :kilograms, :quantity, :date_time_utc)
  end
end
