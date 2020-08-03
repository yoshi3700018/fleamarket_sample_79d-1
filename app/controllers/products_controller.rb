class ProductsController < ApplicationController

  def index
    # @product = Product.all.includes(:images)
    # @product = Product.includes(:images)
    @product = Product.all
    # @product = Product.find_by(id: 1)
    # @image = Image.includes(:product)
    # binding.pry
    # @image = Image.new(product_params)
  end

  def new
    @product = Product.new
    @product.images.build
    @parents = Category.all.order("id ASC").limit(13)
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end
  
  def update
  end

  def show
    @product = Product.find(params[:id])
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
      :pname, :explanation, 
      :status, :size_id, 
      :category_id, :brand_id, 
      :shipping_status, :deliver, 
      :prefecture, :shipping_dates, 
      :price, :users_id, 
      images_attributes: {image: []}).merge(user_id: current_user.id)
  end
end
