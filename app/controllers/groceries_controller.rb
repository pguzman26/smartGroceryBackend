class GroceriesController < ApplicationController
  def index   # i.e. read *all* gorceries
    render json: Grocery
  end

  def show    # i.e. read *one* grocery
    render json: Grocery.find(params[:id])
  end

  def create
    grocery = Grocery.create(grocery_params)
    if grocery.save
      render json: grocery
    else
      render json: sale.errors, status: :unprocessable_entity
    end
  end

  def update
    grocery = Grocery.find(param[:id])
    if grocery.update(grocery_params)
      grocery.save
      render json: grocery
    else
      render json: grocery.errors, status: :unprocessable_entity
    end
  end

  def destroy
    grocery = Grocery.find(params[:id])
    grocery.destroy
  end

  private
  def grocery_params
    params.require(:grocery)
  end
end
