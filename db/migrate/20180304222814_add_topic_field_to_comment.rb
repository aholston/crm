class AddTopicFieldToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :topic, :integer
  end
end
