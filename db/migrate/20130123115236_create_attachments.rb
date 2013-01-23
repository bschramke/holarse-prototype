class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
        t.references :article
        t.string :description
     
        t.timestamps
    end
  end
end
