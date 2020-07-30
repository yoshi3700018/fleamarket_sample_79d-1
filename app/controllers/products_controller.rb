class ProductsController < ApplicationController

  def index
    @product = Product.all.includes(:images)
    # @product = Product.includes(:images)
    # @product = Product.all
    # @product = Product.find_by(id: 1)
    # @image = Image.includes(:product)
    # binding.pry
    # @image = Image.new(product_params)
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

  private
  def product_params
    params.require(:product).permit(
    :pname, :price,
    :explanation, :status, 
    :size_id, :brand_id,
    :category_id, :shipping_id,
    :deliver, :prefecture,
    :shipping_dates,
    images_attributes: [:id, :image]).merge(user_id: current_user.id)
  end

end
