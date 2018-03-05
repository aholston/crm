class AddHouseReferenceToTasklist < ActiveRecord::Migration[5.1]
  def change
    add_reference :tasklists, :house, foreign_key: true
  end
end
