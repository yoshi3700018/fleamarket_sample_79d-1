class Image < ApplicationRecord

  # validates :image, presence: true

  belongs_to :product, inverse_of: :images
  # belongs_to :product, ioptonal: true

  mount_uploader :image, ImageUploader
end

