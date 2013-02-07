class Video < ActiveRecord::Base
    attr_accessible :description, :url

    validates_presence_of :url

    has_and_belongs_to_many :news
    has_and_belongs_to_many :articles
end
