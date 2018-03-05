class CreateAttractions < ActiveRecord::Migration[5.1]
  def change
    create_table :attractions do |t|
      t.references :info, foreign_key: true

      t.timestamps
    end
  end
end
