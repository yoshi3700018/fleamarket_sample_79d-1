class CreatePostals < ActiveRecord::Migration[6.0]
  def change
    create_table :postals do |t|
      t.string            :postal_code,   null: false
      t.integer           :prefecture,    null: false
      t.string            :city,          null: false
      t.string            :address_line,  null: false
      t.string            :apartment    
      t.references        :users,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
