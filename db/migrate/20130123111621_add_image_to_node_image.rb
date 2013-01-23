class AddImageToNodeImage < ActiveRecord::Migration
    def self.up
        add_attachment :node_images, :image
    end

    def self.down
        remove_attachment :node_images, :image
    end
end
