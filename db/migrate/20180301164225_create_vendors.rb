class CreateVendors < ActiveRecord::Migration[5.1]
  def change
    create_table :vendors do |t|
      t.string :company
      t.string :type
      t.string :phone
      t.string :source

      t.timestamps
    end
  end
end
