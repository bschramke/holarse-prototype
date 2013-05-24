class AddParentIdToArticleAndNews < ActiveRecord::Migration
  def change
    add_column :news, :parent_id, :integer
    add_column :articles, :parent_id, :integer
  end
end
