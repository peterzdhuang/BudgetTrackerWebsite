class SpendingsController < ApplicationController
  before_action :set_spending, only: %i[show update destroy]

  # GET /spendings
  def index
    @spendings = Spending.all
    respond_to do |format|
      format.html # This is for regular HTML requests
      format.turbo_stream # This is for Turbo Stream updates
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
