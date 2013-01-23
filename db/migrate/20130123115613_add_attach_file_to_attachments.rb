class AddAttachFileToAttachments < ActiveRecord::Migration
    def self.up
        add_attachment :attachments, :attachfile
    end

    def self.down
        remove_attachment :attachments, :attachfile
    end
end
