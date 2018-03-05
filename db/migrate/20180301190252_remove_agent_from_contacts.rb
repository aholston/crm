class RemoveAgentFromContacts < ActiveRecord::Migration[5.1]
  def change
    remove_reference :contacts, :agent, foreign_key: true
  end
end
