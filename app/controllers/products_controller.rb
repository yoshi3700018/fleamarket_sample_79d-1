class ProductsController < ApplicationController

  def index
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
    params.require(:product).permit(:pname, :explanation, :status, :size_id, :category_id, :brand_id, :shipping_status, :deliver, :prefecture, :shipping_dates, :price, :users_id, images_attributes: {image: []})
  end


end
