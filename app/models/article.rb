class Article < ActiveRecord::Base
    attr_accessible :title, :alternate_title, :content, :unreleased, :releasedate, :user

    # validierungen
    validates_presence_of :title, :content, :user

    # referenzen
    belongs_to :user
    has_many :article_histories
    has_and_belongs_to_many :screenshots
    has_and_belongs_to_many :videos
    has_and_belongs_to_many :links
    has_and_belongs_to_many :attachments
    has_many :discount_events

    has_and_belongs_to_many :comments

    def teaser
      content[0..20] + "..."
    end

end

