class AddDiasporaToUser < ActiveRecord::Migration
  def change
    add_column :users, :diaspora, :string
  end
end
