class Image < ApplicationRecord

  validates :image, presence: true
  
  belongs_to :product, inverse_of: :images

  mount_uploaders :image, ImageUploader
end