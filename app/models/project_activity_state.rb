class ProjectActivityState < ActiveRecord::Base
  attr_accessible :name, :code

  has_many :articles
  
  validates_presence_of :code
  validates_uniqueness_of :code
end
