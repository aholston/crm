class AddStepFieldToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :step, :integer
  end
end
