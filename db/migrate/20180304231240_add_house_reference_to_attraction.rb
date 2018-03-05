class AddHouseReferenceToAttraction < ActiveRecord::Migration[5.1]
  def change
    add_reference :attractions, :house, foreign_key: true
  end
end
