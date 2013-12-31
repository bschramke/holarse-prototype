class CreateDrafts < ActiveRecord::Migration
  def change
    create_table :drafts do |t|
      t.references :draftable, polymorphic: true
      t.text :draftedtext
      t.references :user
      t.boolean :allow_collaboration, default: false
      t.integer :merge_revision
      t.timestamps
    end
  end
end
