class Contract < ApplicationRecord
  # attr_accessor :attachment
  belongs_to :house
  mount_uploader :attachment, DocumentUploader
end
