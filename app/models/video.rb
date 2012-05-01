class Video
  include Mongoid::Document
  include Mongoid::Timestamps

  field :description  
  field :data

  embedded_in :article
  embedded_in :news
  embedded_in :newsupdate
  
end
