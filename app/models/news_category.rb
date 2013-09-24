class NewsCategory < ActiveRecord::Base
  attr_accessible :name, :description

  # references
  has_many :news

  # validations
  validates_presence_of :name
  validates_uniqueness_of :name

end
