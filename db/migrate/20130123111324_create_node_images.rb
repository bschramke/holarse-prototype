class CreateNodeImages < ActiveRecord::Migration
  def change
    create_table :node_images do |t|
        t.string :description
        t.references :article
        t.timestamps
    end
  end
end
