class News < ActiveRecord::Base

  #slug :title, :history => true  
  
  #fulltext_search_in :title, :subtitle, :content, :index_name => 'nodes',
                   #:filters => { :is_not_disabled => lambda { |x| !x.disabled }}
  
  has_many :screenshots
  has_many :attachments  
  has_many :videos
  has_many :newsupdates
  has_many :links
  has_many :comments




  
  validates_presence_of :title  
  validates :title, :length => { :minimum => 3 }  
  validates_presence_of :content
#  validates_presence_of :changelog
  #validates_presence_of :author  
  #validates :content, :length => { :minimum => 10 }
  
  belongs_to :author, :class_name => "User", :inverse_of => :news
  
end
