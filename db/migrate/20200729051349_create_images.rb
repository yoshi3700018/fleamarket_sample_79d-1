class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.references, :product_id, foreign_key: true
      t.text :image, null: false

      t.timestamps
    end
  end
end
