class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :image do |t|
      t.references   :product,   null: false,    foreign_key: true
      t.text         :image,     null: false
      t.timestamps
    end
  end
end
