class Attachment < ActiveRecord::Base
    attr_accessible :description, :attachfile

    has_attached_file :attachfile
    has_and_belongs_to_many :news

end
