class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :house, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
