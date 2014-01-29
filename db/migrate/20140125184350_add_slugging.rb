class AddSlugging < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string, null: false
    #add_index :users, :slug, unique: true

    add_column :news, :slug, :string, null: false
    #add_index :news, :slug, unique: true

    add_column :articles, :slug, :string, null: false
    #add_index :articles, :slug, unique: true
  end
end
