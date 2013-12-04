class Shop < ActiveRecord::Base
  # validierungen
  validates_presence_of :name
  validates_uniqueness_of :name
end
