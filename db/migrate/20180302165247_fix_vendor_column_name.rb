class FixVendorColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :vendors, :type, :service
  end
end
