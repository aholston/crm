class AddRatingFieldToVendor < ActiveRecord::Migration[5.1]
  def change
    add_column :vendors, :rating, :integer, :default => 1
    
  end
end
