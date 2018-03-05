class Tasklist < ApplicationRecord
  belongs_to :house
  has_many :tasks, dependent: :destroy
end
