class CreateArticleHistories < ActiveRecord::Migration
  def change
    create_table :article_histories do |t|
        t.string :title
        t.string :alternate_title
        t.text   :content

        t.references :user
        t.references :article

        t.timestamps
    end
  end
end
