class AddCollaborationToUser < ActiveRecord::Migration
  def change
    add_column :users, :collaborate, :boolean, default: false
  end
end
