class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :clients, :type, :listing
  end
end
