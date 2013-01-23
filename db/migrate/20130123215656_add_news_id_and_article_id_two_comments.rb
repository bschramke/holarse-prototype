class AddNewsIdAndArticleIdTwoComments < ActiveRecord::Migration
  def change
    add_column :comments, :news_id, :integer
    add_column :comments, :article_id, :integer
  end
end
