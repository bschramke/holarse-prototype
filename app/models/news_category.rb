class NewsCategory < ActiveRecord::Base
  # TODO in ein storage statt ein model umwandeln

  # references
  has_many :news

  # validations
  validates_presence_of :name
  validates_uniqueness_of :name
end
