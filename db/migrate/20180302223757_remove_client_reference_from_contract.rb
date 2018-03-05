class RemoveClientReferenceFromContract < ActiveRecord::Migration[5.1]
  def change
    remove_column :contracts, :client_id
  end
end
