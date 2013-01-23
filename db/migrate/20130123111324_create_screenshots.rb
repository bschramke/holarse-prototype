class CreateScreenshots < ActiveRecord::Migration
  def change
    create_table :screenshots do |t|
        t.string :description
        t.references :article
        t.references :news
        t.timestamps
    end
  end
end
