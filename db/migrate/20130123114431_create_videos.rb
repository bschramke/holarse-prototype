class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.string :description
      t.references :article
      t.references :news
      t.timestamps
    end
  end
end
