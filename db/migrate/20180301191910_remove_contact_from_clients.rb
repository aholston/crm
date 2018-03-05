class RemoveContactFromClients < ActiveRecord::Migration[5.1]
  def change
    remove_reference :clients, :contact, foreign_key: true
  end
end
