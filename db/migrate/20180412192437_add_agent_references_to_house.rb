class AddAgentReferencesToHouse < ActiveRecord::Migration[5.1]
  def change
    add_reference :houses, :agent, foreign_key: true
  end
end
