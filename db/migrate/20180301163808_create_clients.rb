class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.date :birthday
      t.string :type
      t.string :cio

      t.timestamps
    end
  end
end
