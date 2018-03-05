class AddClientAndAgentToContacts < ActiveRecord::Migration[5.1]
  def change
    add_reference :contacts, :client, foreign_key: true
    add_reference :contacts, :agent, foreign_key: true
  end
end
