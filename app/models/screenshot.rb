class Screenshot
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip  

  field :description  
  field :position, :type => Integer, :default => 0
  
  has_mongoid_attached_file :img

  embedded_in :article
  embedded_in :news
  embedded_in :newsupdate
  
end
