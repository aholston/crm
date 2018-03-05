class RemoveClientFromContacts < ActiveRecord::Migration[5.1]
  def change
    remove_reference :contacts, :client, foreign_key: true
  end
end
