class Link
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description
  field :url
  
  validates_presence_of :url
  
  embedded_in :article
  embedded_in :news
  embedded_in :newsupdate
  
end
