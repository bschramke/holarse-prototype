class RenameNewsAlternateTitleToSubtitle < ActiveRecord::Migration
    def change
        add_column :news, :subtitle, :string
        remove_column :news, :alternate_title
    end
end
