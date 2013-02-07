class Screenshot < ActiveRecord::Base
    attr_accessible :image, :description
    
    has_attached_file :image, :styles => { :small => "150x150>" }
    
    has_and_belongs_to_many :news
    has_and_belongs_to_many :articles
end
