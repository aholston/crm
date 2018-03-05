class Reccomendation < ApplicationRecord
  belongs_to :vendor
  belongs_to :client
end
