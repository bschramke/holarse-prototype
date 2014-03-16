class Video < ActiveRecord::Base
  validates_presence_of :url

  belongs_to :videoable, polymorphic: true
end
