class RemoveHouseReferenceFromAgents < ActiveRecord::Migration[5.1]
  def change
    remove_column :agents, :house_id
  end
end
