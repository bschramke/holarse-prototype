class AddEventToRevision < ActiveRecord::Migration
  def change
    add_column :revisions, :event, :string
  end
end
