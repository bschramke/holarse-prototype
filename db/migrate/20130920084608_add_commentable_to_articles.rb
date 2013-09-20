class AddCommentableToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :commentable, :boolean, default: true
  end
end
