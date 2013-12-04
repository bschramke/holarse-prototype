class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.references :historical, polymorphic: true
      t.text :changedset
      t.references :user
      t.timestamps
    end
  end
end
