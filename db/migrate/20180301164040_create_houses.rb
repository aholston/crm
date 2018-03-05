class CreateHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :address
      t.integer :rooms
      t.integer :bathrooms
      t.float :sqft
      t.string :type
      t.text :description
      t.float :price
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
