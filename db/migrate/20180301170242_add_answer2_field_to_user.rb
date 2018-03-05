class AddAnswer2FieldToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :answer2, :string
  end
end
