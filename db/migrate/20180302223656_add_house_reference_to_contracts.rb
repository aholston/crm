class AddHouseReferenceToContracts < ActiveRecord::Migration[5.1]
  def change
    add_reference :contracts, :house, foreign_key: true
  end
end
