class Client < ApplicationRecord
  has_many :houses
  has_many :contacts
  has_one :buyer
  has_one :investor
end
