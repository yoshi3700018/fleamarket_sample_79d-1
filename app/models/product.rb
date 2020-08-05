class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :country

  belongs_to :user, optional: true
  # 実装中の為、user_idを無効化中 富田
  belongs_to :category, optional: true
  has_many :images
  
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :pname, :explanation, :price, :images, :prefecture, presence: true
  validates :category_id, :status, 
  :deliver,
  :shipping_dates, numericality: { other_than: 0}
end
