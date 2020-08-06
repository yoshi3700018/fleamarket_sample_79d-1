class CategoriesController < ApplicationController

  def index
    @parents = Category.where(ancestry: nil)
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.set_products
    @products = @products.where(shipping_status: nil).order("created_at_DESC").page(params[:page]).per(9)
  end
  
  def set_products
    #LEVEL1
    if self.root?
      start_id = self.indirects.first.id
      end_id = self.indirects.last.id
      products = Product.where(category_id: start_id..end_id)
      return products
    #LEVEL2
    elsif self.has_children?
      start_id = self.children.first.id
      end_id = self.children.last.id
      products = Product.where(category_id: start_id..end_id)
      return products
    #LEVEL3
    else
      return self.products
    end
  end
end