class AddTotalMadeFieldToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :total_made, :float, :default => 0
  end
end
