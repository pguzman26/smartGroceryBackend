class GroceriesController < ApplicationController
  def index   # i.e. read *all* gorceries
    groceries = Grocery.all
    render json: groceries
  end

  def show    # i.e. read *one* grocery
    render json: Grocery.find(params[:id])
    if grocery.show(grocery_params)
      render json: grocery
    else
      render json: grocery.errors, status: :unprocessable_entity
    end
  end

  def create
    grocery = Grocery.create(grocery_params) # grocery_params
    if grocery.save
      render json: grocery
    else
      render json: grocery.errors, status: :unprocessable_entity
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
    render json: nil, status: :no_content
  end

  private
  def grocery_params
    params.require(:grocery).permit(:name)
  end
end
