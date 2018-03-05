class AddQuestion2FieldToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :question2, :string
  end
end
