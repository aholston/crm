class AddQuestion3FieldToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :question3, :string
  end
end
