class AddNotesFieldToVendor < ActiveRecord::Migration[5.1]
  def change
    add_column :vendors, :notes, :string
  end
end
