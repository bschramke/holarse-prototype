class Screenshot
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip  

  field :description  
  
  has_mongoid_attached_file :img

  embedded_in :article
  embedded_in :news
  embedded_in :newsupdate
  
end
