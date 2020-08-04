class ProductsController < ApplicationController

  def index
    @product = Product.all.limit(4).order(created_at: :desc)
  end

  def new
    @product = Product.new
    @product.images.build
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
      :price, 
      images_attributes: [:id, :image]).merge(user_id: current_user.id)
  end
end
