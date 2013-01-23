class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.references :user
	t.string :content
	
	t.boolean :enabled, :default => true

	t.timestamps
    end
  end
end
