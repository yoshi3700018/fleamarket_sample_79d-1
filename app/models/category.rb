class Category < ApplicationRecord
  has_many :products
  has_ancestry
  # validates :name, presence:true

  def set_products
    # ancestry固有のインスタンスメソッドを使用する
    # indirects 孫に当たるレコードを返す
    # has_children? / children? 子に当たるレコードを持つならTRUE
    
    #LEVEL1
    if self.root?
      start_id = self.indirects.first.id
      end_id = self.indirects.last.id
      products = Product.where(category_id: start_id..end_id)
    #LEVEL2
    elsif self.has_children?
      start_id = self.children.first.id
      end_id = self.children.last.id
      products = Product.where(category_id: start_id..end_id)
    #LEVEL3
    else
      return self.products
    end
  end
  
end
