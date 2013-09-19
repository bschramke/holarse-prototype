class AddVersionChangeset < ActiveRecord::Migration
  def up
    add_column :versions, :object_changes, :string
  end

  def down
    drop_column :versions, :object_changes
  end
end
