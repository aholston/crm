class RemoveQuestion1FieldFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :question1
    remove_column :users, :question2
    remove_column :users, :question3
    remove_column :users, :answer1
    remove_column :users, :answer2
    remove_column :users, :answer3

  end
end
