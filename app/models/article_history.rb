class ArticleHistory < ActiveRecord::Base

    # validierungen
    validates_presence_of :title, :content
    
    # referenzen
    belongs_to :article
    belongs_to :user

end
