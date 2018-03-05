class CreateInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :infos do |t|
      t.references :infolist, foreign_key: true
      t.string :name
      t.integer :year
      t.string :kind
      t.string :primary_school
      t.string :high_school
      t.string :attractions
      t.string :businesses
      t.date :photographer

      t.timestamps
    end
  end
end
