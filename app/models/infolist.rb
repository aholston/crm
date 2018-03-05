class Infolist < ApplicationRecord
  belongs_to :house
  has_many :infos, dependent: :destroy
end
