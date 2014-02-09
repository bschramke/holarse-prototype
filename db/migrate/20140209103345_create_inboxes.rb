class CreateInboxes < ActiveRecord::Migration
  def change
    create_table :inboxes do |t|

      t.string :sender
      t.string :url
      t.text :info

      t.boolean :active, default: true

      t.timestamps
    end
  end
end
