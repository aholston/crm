class CreateShowings < ActiveRecord::Migration[5.1]
  def change
    create_table :showings do |t|
      t.references :house, foreign_key: true
      t.date :day
      t.time :when

      t.timestamps
    end
  end
end
