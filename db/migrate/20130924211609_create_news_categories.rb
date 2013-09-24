class CreateNewsCategories < ActiveRecord::Migration
  def up
    create_table :news_categories do |t|
      t.string :name
      t.string :description
    end

    change_table :news do |t|
      t.references :news_category
    end
  end
end
