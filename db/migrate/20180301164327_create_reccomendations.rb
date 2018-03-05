class CreateReccomendations < ActiveRecord::Migration[5.1]
  def change
    create_table :reccomendations do |t|
      t.references :vendor, foreign_key: true
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
