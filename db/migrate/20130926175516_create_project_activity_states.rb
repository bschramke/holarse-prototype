class CreateProjectActivityStates < ActiveRecord::Migration
  def up
    create_table :project_activity_states do |t|
      t.string :name
    end

    change_table :articles do |t|
      t.references :project_activity_state
    end
  end
end
