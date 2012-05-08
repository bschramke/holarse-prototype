class Newsupdate
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::FullTextSearch  

  field :author
  field :content
  
  fulltext_search_in :content, :index_name => 'nodes'  
  
  embedded_in :news
  
  embeds_many :screenshots
  embeds_many :attachments  
  embeds_many :videos   
  embeds_many :links  
  
  validates_presence_of :content
  validates_presence_of :author 
  validates :content, :length => { :minimum => 10 }
  
end
