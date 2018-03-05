class AddPrepaFieldToInfo < ActiveRecord::Migration[5.1]
  def change
    add_column :infos, :prepa, :string
  end
end
