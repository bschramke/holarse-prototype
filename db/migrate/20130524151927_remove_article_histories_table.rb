class RemoveArticleHistoriesTable < ActiveRecord::Migration
  def up
    drop_table :article_histories
  end

  def down
  end
end
