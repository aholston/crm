class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :tasklist, foreign_key: true

      t.timestamps
    end
  end
end
