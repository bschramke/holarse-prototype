class CleanupArticleAndNewsReltations < ActiveRecord::Migration
  def up
    # links entzerren aus news
    create_table :links_news, :id => false do |t|
      t.references :news
      t.references :link
    end
    remove_column :links, :news_id

    # links entzerren aus article
    create_table :articles_links, :id => false do |t|
      t.references :article
      t.references :link
    end

    # comments aus article entzerren
    create_table :articles_comments, :id => false do |t|
      t.references :article
      t.references :comment
    end
    remove_column :comments, :article_id

    # attachment aus article entzerren (newsid nicht enthalten)
    create_table :articles_attachments, :id => false do |t|
      t.references :article
      t.references :attachment
    end
    remove_column :attachments, :article_id

    # screenshots aus articles entzerren
    create_table :articles_screenshots, :id => false do |t|
      t.references :article
      t.references :screenshot
    end
    remove_column :screenshots, :article_id

    # screenshots aus news entzerren
    create_table :news_screenshots, :id => false do |t|
      t.references :news
      t.references :screenshot
    end
    remove_column :screenshots, :news_id

    # video aus articles entzerren
    create_table :articles_videos, :id => false do |t|
      t.references :article
      t.references :video
    end
    remove_column :videos, :article_id

    # video aus news entzerren
    create_table :news_videos, :id => false do |t|
      t.references :news
      t.references :video
    end
    remove_column :videos, :news_id
  end

  def down
  end
end
