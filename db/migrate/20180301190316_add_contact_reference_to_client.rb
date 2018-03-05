class AddContactReferenceToClient < ActiveRecord::Migration[5.1]
  def change
    add_reference :clients, :contact, foreign_key: true
  end
end
