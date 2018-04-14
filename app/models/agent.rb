class Agent < ApplicationRecord
  has_one :house
  has_many :contacts, dependent: :destroy

  def self.search(search)
    if search
      Agent.where('first_name LIKE ?', "%#{search}%").or(Client.where('last_name LIKE ?', "%#{search}%"))
    else
      Agent.all
    end
  end
end
