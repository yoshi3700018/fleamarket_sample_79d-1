class Product < ApplicationRecord
  belongs_to :user, optional: true
  # 実装中の為、user_idを無効化中　富田
  belongs_to :category
  has_many :images, inverse_of: :product
  
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :pname, :price, :explanation, :status, presence: true
end
