class Info < ApplicationRecord
  belongs_to :infolist
  has_many :attractions, dependent: :destroy
end
