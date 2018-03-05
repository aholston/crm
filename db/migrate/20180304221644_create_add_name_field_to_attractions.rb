class CreateAddNameFieldToAttractions < ActiveRecord::Migration[5.1]
  def change
    create_table :add_name_field_to_attractions do |t|
      t.string :name

      t.timestamps
    end
  end
end
