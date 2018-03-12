class House < ApplicationRecord
  belongs_to :client
  has_many :contracts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :showings, dependent: :destroy
  has_many :attractions, dependent: :destroy
  has_one :tasklist, dependent: :destroy
  has_one :infolist, dependent: :destroy

end
