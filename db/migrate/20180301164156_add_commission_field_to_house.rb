class AddCommissionFieldToHouse < ActiveRecord::Migration[5.1]
  def change
    add_column :houses, :commission, :float
  end
end
