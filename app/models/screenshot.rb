class Screenshot < ActiveRecord::Base
    attr_accessible :image, :description
    
    has_attached_file :image, :styles => { :small => "150x150>" }
    
    belongs_to :article
    belongs_to :news
end
