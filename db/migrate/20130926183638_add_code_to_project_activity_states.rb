class AddCodeToProjectActivityStates < ActiveRecord::Migration
  def change
    add_column :project_activity_states, :code, :string
  end
end
