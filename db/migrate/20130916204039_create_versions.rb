class CreateVersions < ActiveRecord::Migration
  def self.up
    create_table :versions do |t|
      t.string   :item_type, :null => false
      t.integer  :item_id,   :null => false
      t.string   :event,     :null => false
      t.string   :whodunnit
      t.text     :object
      t.datetime :created_at
    end
    add_index :versions, [:item_type, :item_id]

    remove_column :articles, :historical
    remove_column :articles, :parent_id
    remove_column :news, :historical
    remove_column :news, :parent_id
  end

  def self.down
    remove_index :versions, [:item_type, :item_id]
    drop_table :versions

    add_column :news, :historical, :boolean, :default => false
    add_column :articles, :historical, :boolean, :default => false

    add_column :news, :parent_id, :integer
    add_column :articles, :parent_id, :integer
  end
end
