class Contact < ApplicationRecord
  belongs_to :client, required: false
  belongs_to :agent, required: false
end
