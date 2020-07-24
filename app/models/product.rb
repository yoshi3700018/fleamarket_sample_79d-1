class Product < ApplicationRecord
  belongs_to :user

  validates :pname, :price, :explanation, :status, presence: true
end
