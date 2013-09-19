class RemoveArticleFromDiscountEvent < ActiveRecord::Migration
  def up
    remove_column :article_id, :discount_event
  end

  def down
  end
end
