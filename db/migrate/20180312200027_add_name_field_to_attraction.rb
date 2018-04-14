class AddNameFieldToAttraction < ActiveRecord::Migration[5.1]
  def change
    add_column :attractions, :name, :string
  end
end
