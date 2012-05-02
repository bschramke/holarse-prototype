class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :author
  field :content
  field :deleted, :type => Boolean, :default => false
  field :released, :type => Boolean, :default => false
  
  embedded_in :article
  embedded_in :news
  
  embeds_many :screenshots
  embeds_many :attachments  
  embeds_many :videos    
  embeds_many :links  
  
  validates_presence_of :author
  validates :content, :length => { :minimum => 10 }
  
end
