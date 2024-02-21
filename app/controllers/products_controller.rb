class ProductsController < ApplicationController

  # If not using this, Rails will add a additional query to fetch the category.
  def index
    @products = Product.includes(:category).all
  end

  def show
    @product = Product.find(params[:id])
  end
end
