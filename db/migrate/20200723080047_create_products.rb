class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|    
      t.string      :pname,           null: false, index: true
      t.integer     :price,           null: false
      t.text        :explanation,     null: false
      t.integer     :status,          null: false
      
      #ancestryで管理する、バリデーションは専用テーブル作成後
      t.integer     :size_id
      t.integer     :brand_id
      t.integer     :category_id
      t.integer     :shipping_status  
      t.integer     :deliver        
      t.integer     :prefecture
      t.integer     :shipping_dates

      #外部キー
      t.references  :users,           foreign_key: true
      t.timestamps

    end
  end
end
