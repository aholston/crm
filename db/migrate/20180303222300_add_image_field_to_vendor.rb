class AddImageFieldToVendor < ActiveRecord::Migration[5.1]
  def change
    add_column :vendors, :image, :string
  end
end
