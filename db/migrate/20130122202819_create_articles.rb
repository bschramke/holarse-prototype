class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
        t.string :title, :null => false
        t.string :alternate_title
        t.text   :content
        
        t.boolean :enabled, :default => true
        t.boolean :isfrozen, :default => false
        t.boolean :reviseme, :default => false
        t.boolean :unreleased, :default => false
        t.boolean :allowuploads, :default => true
        t.boolean :hasftp, :default => false
        t.string  :releasedate

        t.string  :changelog
        
        t.references :user
        
        t.timestamps
    end
  end
end
