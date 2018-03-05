class FixContactsColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :contacts, :type, :method
  end
end
