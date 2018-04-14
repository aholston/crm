class Client < ApplicationRecord
  has_many :houses , dependent: :destroy
  has_many :contacts
  has_one :buyer
  has_one :investor
  

  def self.search(search)
    if search
      Client.where('first_name LIKE ?', "%#{search}%").or(Client.where('last_name LIKE ?', "%#{search}%"))
    else
      Client.all
    end
  end
end
