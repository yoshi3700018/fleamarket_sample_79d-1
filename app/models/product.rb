class Product < ApplicationRecord
  belongs_to :user
  has_many :images
  validates :pname, :price, :explanation, :status, presence: true
end
