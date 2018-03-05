class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :house, foreign_key: true
      t.references :client, foreign_key: true
      t.float :sale
      t.float :commission

      t.timestamps
    end
  end
end
