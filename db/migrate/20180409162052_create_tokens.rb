class CreateTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :tokens do |t|
      t.string :access_token
      t.integer :expires_in
      t.string :refresh_token
      t.string :token_type

      t.timestamps
    end
  end
end
