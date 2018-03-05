class RemoveAttractionsFieldFromInfo < ActiveRecord::Migration[5.1]
  def change
    remove_column :infos, :attractions, :string
  end
end
