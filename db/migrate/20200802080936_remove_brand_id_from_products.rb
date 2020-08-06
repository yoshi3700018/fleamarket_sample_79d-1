class RemoveBrandIdFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :brand_id, :integer
  end
end
