class CreateDiscountEvents < ActiveRecord::Migration
  def change
    create_table :discount_events do |t|
      t.references :user
      t.references :article
      t.string :name
      t.text :description
      t.datetime :startdate
      t.datetime :enddate
      t.string :website
      t.string :sourceurl

      t.boolean :enabled, :default => true

      t.timestamps
    end
  end
end
