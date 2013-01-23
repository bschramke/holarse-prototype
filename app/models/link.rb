class Link < ActiveRecord::Base
    attr_accessible :description, :url

    validates_presence_of :url

    belongs_to :article
end
