class ProductsController < ApplicationController

  def index
    @product = Product.all
  end

  def new
  end

  def create
  end

  def edit
  end
  
  def update
  end

  def show
    # @product = product.find(params[:id])
  end

  def destroy
  end

  def confirm
  end

  def top
  end

end
