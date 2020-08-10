class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :user_id, presence: true
end
