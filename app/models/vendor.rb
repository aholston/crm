class Vendor < ApplicationRecord
  has_many :reccommendations, dependent: :destroy

  mount_uploader :image, ImageUploader
end
