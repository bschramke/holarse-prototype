class CreateNewsUpdates < ActiveRecord::Migration
  def change
    create_table :news_updates do |t|
      t.string :content

      t.references :user
      t.references :news
      t.timestamps
    end
  end
end
