class Screenshot < ActiveRecord::Base
    attr_accessible :image, :description
    
    has_attached_file :image
    
    belongs_to :article
    belongs_to :news
end
