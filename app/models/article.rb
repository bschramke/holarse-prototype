class Article < ActiveRecord::Base
    attr_accessible :title, :alternate_title, :content, :unreleased, :releasedate, :user

    # validierungen
    validates_presence_of :title, :content, :user

    # referenzen
    belongs_to :user
    has_many :article_histories

end

