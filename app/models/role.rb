class Role < ActiveRecord::Base
  # references 
  has_and_belongs_to_many :users
  
  # validierungen
  validates_presence_of :name
  validates_uniqueness_of :name
end
