class AddCommentableFlagToNews < ActiveRecord::Migration
  def change
    add_column :news, :commentable, :boolean, :default => true
  end
end
