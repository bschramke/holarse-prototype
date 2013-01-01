class Screenshot
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip  

  field :description  
  field :position, :type => Integer, :default => 0
  
  has_mongoid_attached_file :img, :default_url => '/assets/nobody.png'

  embedded_in :article
  embedded_in :news, :inverse_of => :screenshots
  embedded_in :newsupdate
  
end
