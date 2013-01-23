class Article < ActiveRecord::Base
    attr_accessible :title, :alternate_title, :content, :unreleased, :releasedate, :user

    # validierungen
    validates_presence_of :title, :content, :user

    # referenzen
    belongs_to :user
    has_many :article_histories
    has_many :node_images
    has_many :videos
    has_many :links
    has_many :attachments

    has_many :comments

end

