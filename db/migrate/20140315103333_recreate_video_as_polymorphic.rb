class RecreateVideoAsPolymorphic < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.references :videoable, polymorphic: true
    end
  end
end
