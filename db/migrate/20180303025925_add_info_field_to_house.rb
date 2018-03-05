class AddInfoFieldToHouse < ActiveRecord::Migration[5.1]
  def change
    add_column :houses, :info, :string
  end
end
