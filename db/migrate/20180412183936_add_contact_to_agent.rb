class AddContactToAgent < ActiveRecord::Migration[5.1]
  def change
    add_reference :agents, :contact, foreign_key: true
  end
end
