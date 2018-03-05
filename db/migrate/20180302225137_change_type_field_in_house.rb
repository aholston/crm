class ChangeTypeFieldInHouse < ActiveRecord::Migration[5.1]
  def change
    rename_column :houses, :type, :status
  end
end
