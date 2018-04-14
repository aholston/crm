class House < ApplicationRecord
  belongs_to :client
  has_one :agent
  has_many :contracts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :showings, dependent: :destroy
  has_many :attractions, dependent: :destroy
  has_many :tasklists, dependent: :destroy
  has_many :infolists, dependent: :destroy

  validates :address, presence: true

  def self.search(search)
    if search
      House.where('address LIKE ?', "%#{search}%")
    else
      House.all
    end
  end

end
