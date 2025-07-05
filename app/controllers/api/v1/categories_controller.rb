class Api::V1::CategoriesController < ApplicationController
  def index
    categories = Category.all
    render json: categories
  end

  def create
    category = Category.new(category_params)
    if category.save
      render json: category, status: :created
    else
      render json: category.errors, status: :unprocessable_entity
    end
  end

  def update
    category = Category.find(params[:id])
    if category.update(category_params)
      render json: category
    else
      render json: category.errors, status: :unprocessable_entity
    end
  end
  
def destroy
  category = Category.find(params[:id])
  category.destroy
  render json: { message: "Category with ID #{category.id} was successfully deleted." }, status: :ok
rescue ActiveRecord::RecordNotFound
  render json: { error: "Category not found with ID #{params[:id]}" }, status: :not_found
end


  private

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
