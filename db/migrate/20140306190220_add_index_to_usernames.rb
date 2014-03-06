class AddIndexToUsernames < ActiveRecord::Migration
  def change
    add_index :users, :slug, unique: true
    add_index :users, :username
  end
end
