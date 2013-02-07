class ExtractNewsIdFromCommentTable < ActiveRecord::Migration
  def up
    # tabelle erstellen
    create_table :comments_news, :id => false do |t|
      t.references :news
      t.references :comment
    end

    # spalte in comments loeschen
    remove_column :comments, :news_id
  end

  def down
    drop_table :comments_news
    add_column :comments, :news_id, :integer
  end
end
