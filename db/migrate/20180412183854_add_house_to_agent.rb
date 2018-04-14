class AddHouseToAgent < ActiveRecord::Migration[5.1]
  def change
    add_reference :agents, :house, foreign_key: true
  end
end
