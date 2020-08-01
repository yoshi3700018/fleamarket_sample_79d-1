class Product < ApplicationRecord
  # belongs_to :user, optional: true
  belongs_to :user
  belongs_to :category, optional: true
  # 出品機能不具合の為、ユーザー・カテゴリー無効中
  has_many :images, inverse_of: :product
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :pname, :price, :explanation, :status, presence: true
end
