class ProjectActivityState < ActiveRecord::Base
  has_many :articles
  
  validates_presence_of :code
  validates_uniqueness_of :code
end
