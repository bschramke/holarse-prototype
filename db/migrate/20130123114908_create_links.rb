class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :description
      t.references :article
      t.references :news
  
      t.timestamps
    end
  end
end
