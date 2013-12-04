class Attachment < ActiveRecord::Base
  has_attached_file :attachfile
  has_and_belongs_to_many :news
end
