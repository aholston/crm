class CreateInfolists < ActiveRecord::Migration[5.1]
  def change
    create_table :infolists do |t|
      t.references :house, foreign_key: true

      t.timestamps
    end
  end
end
