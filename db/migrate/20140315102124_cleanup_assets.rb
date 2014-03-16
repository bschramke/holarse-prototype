class CleanupAssets < ActiveRecord::Migration
  def change
    drop_table :articles_videos

    drop_table :news_screenshots
    drop_table :news_videos

    drop_table :attachments
    drop_table :links
    drop_table :screenshots
    drop_table :shops
    drop_table :videos
    drop_table :links_news
  end
end
