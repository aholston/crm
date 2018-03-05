class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :clients, :type, :listing
    rename_column :contacts, :type, :method
    rename_column :houses, :type, :listing
    rename_column :vendors, :type, :service


  end
end
