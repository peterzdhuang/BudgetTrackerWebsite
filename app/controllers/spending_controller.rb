class SpendingsController < ApplicationController
  before_action :set_spending, only: %i[show update destroy]

  # GET /spendings
  def index
    spendings = Spending.all
    render json: spendings
  end

  # GET /spendings/:id
  def show
    render json: @spending
  end

  # POST /spendings
  def create
    spending = Spending.new(spending_params)
    if spending.save
      render json: spending, status: :created
    else
      render json: spending.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /spendings/:id
  def update
    if @spending.update(spending_params)
      render json: @spending
    else
      render json: @spending.errors, status: :unprocessable_entity
    end
  end

  # DELETE /spendings/:id
  def destroy
    @spending.destroy
    head :no_content
  end

  private

  def set_spending
    @spending = Spending.find(params[:id])
  end

  def spending_params
    params.require(:spending).permit(:name, :price, :kilograms, :quantity, :date_time_utc)
  end
end
