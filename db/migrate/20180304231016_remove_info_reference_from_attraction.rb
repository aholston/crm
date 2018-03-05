class RemoveInfoReferenceFromAttraction < ActiveRecord::Migration[5.1]
  def change
    remove_column :attractions, :info_id
  end
end
