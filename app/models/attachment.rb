class Attachment < ActiveRecord::Base
    attr_accessible :description, :attachfile

    has_attached_file :attachfile
    belongs_to :article

end
