class CreateBuyers < ActiveRecord::Migration[5.1]
  def change
    create_table :buyers do |t|
      t.string :financer
      t.float :cash
      t.string :purchase_type
      t.string :cio
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
