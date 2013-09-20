class ReviseCommentingCompletly < ActiveRecord::Migration
  
  def up
    # erstmal komplett aufraeumen
    remove_column :articles, :commentable
    drop_table :articles_comments
    drop_table :comments
    drop_table :comments_news
    remove_column :discount_events, :commentable
    remove_column :news, :commentable
    
    # und wieder alles anlegen
    add_column :articles, :comments_allowed, :boolean, default: true
    add_column :news, :comments_allowed, :boolean, default: true
    add_column :discount_events, :comments_allowed, :boolean, default: true

    create_table :comments do |t|
      t.references :user
      t.string :content
      t.boolean :enabled, default: true
      t.references :commentable, polymorphic: true
      t.timestamps
    end



  end

end
