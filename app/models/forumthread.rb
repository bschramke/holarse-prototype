class Forumthread
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :content
  field :forum

  field :closed, :type => Boolean, :default => false
  field :roles, :type => Array, :default => []
  
  belongs_to :author, :class_name => "User", :inverse_of => :forumthreads  
  
  embeds_many :screenshots
  embeds_many :attachments  
  embeds_many :videos    
  embeds_many :links
  embeds_many :comments  
  
  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :forum
  validates_presence_of :author  
  
  validates_length_of :title, :minimum => 3
  validates_length_of :content, :minimum => 10
  
end
