class Transaction < ApplicationRecord
  belongs_to :house
  belongs_to :client
end
