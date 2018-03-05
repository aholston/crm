class AddAnswer3FieldToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :answer3, :string
  end
end
