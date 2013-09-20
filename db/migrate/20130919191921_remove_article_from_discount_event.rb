class RemoveArticleFromDiscountEvent < ActiveRecord::Migration
  def change
    remove_column :discount_events, :article_id
  end
end
