class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :description
      t.string :type
      t.text :notes
      t.references :agent, foreign_key: true
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
