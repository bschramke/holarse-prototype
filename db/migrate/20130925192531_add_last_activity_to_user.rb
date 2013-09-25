class AddLastActivityToUser < ActiveRecord::Migration
  def change
    add_column :users, :lastactivity, :datetime
  end
end
