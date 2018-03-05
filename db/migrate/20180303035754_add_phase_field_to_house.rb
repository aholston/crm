class AddPhaseFieldToHouse < ActiveRecord::Migration[5.1]
  def change
    add_column :houses, :phase, :integer
  end
end
