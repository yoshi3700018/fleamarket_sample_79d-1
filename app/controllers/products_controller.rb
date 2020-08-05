class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]

  def index
  end

  def new
    @product = Product.new
    @product.images.new
    # @parents = Category.all.order("id ASC").limit(13)
  end

  def create
    # binding.pry
    @product = Product.create(product_params)
    if @product.save
      @product.update(shipping_status: 1)
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
    params.require(:product).permit(:pname,
    :explanation, :status,
    :size_id, :category_id,
    :brand, :shipping_status,
    :deliver, :prefecture,
    :shipping_dates, :price,
    :users_id, images_attributes: [:image]
  )
  end

  def set_product
    @product = Product.find(params[:id])
  end
  
end
