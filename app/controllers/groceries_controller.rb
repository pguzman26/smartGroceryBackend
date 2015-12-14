class GroceriesController < ApplicationController
  def index   # i.e. read *all* gorceries
    groceries = current_user.groceries
    render json: groceries
  end

  def show    # i.e. read *one* grocery
    grocery = current_user.groceries.find(params[:id])
    render json: grocery, status: :ok
  end

  def create
    grocery = current_user.groceries.create(grocery_params) # grocery_params
    if grocery.save
      render json: grocery, status: :created
    else
      render json: grocery.errors, status: :unprocessable_entity
    end
  end

  def update
    grocery = current_user.groceries.find(params[:id])
    if grocery.update(name: params[:name])
      grocery.save
      render json: grocery, status: :ok
    else
      render json: grocery.errors, status: :unprocessable_entity
    end
  end

  def destroy
    grocery = current_user.groceries.find(params[:id])
    grocery.destroy
    render json: nil, status: :no_content
  end

  private

  def grocery_params
    params.require(:grocery).permit(:name)
  end
end
