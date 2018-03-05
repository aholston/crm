class CreateInvestors < ActiveRecord::Migration[5.1]
  def change
    create_table :investors do |t|
      t.string :profit_margin
      t.string :sales_price
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
