class AddHistorificationToModels < ActiveRecord::Migration
  def change
    add_column :news, :historical, :boolean, :default => false
    add_column :articles, :historical, :boolean, :default => false
  end
end
