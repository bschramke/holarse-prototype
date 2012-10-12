class Video
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description  
  field :url

  embedded_in :article, :inverse_of => :videos
  embedded_in :news, :inverse_of => :videos
  embedded_in :newsupdate
  
end
