class AddLevFieldToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :level, :string
  end
end
