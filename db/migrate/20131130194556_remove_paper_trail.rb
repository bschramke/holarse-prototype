class RemovePaperTrail < ActiveRecord::Migration
  def self.up
    drop_table :versions
  end
end
