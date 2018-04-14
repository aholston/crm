class Vendor < ApplicationRecord
  validates :rating, :inclusion => { :in => 1..5, :message => "The rating must be between 1 and 5" }

  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      Vendor.where('company LIKE ?', "%#{search}%")
    else
      Vendor.all
    end
  end
end
