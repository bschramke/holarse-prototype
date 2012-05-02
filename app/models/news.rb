class News
  include Mongoid::Document  
  include Mongoid::Timestamps

  field :title
  field :subtitle  
  field :content
  field :tags, :type => Array
  field :disabled, :type => Boolean, :default => false
  field :frozen, :type => Boolean, :default => false

  embeds_many :screenshots  
  embeds_many :attachments  
  embeds_many :videos  
  embeds_many :newsupdates
  embeds_many :links  
  embeds_many :comments
  
  validates_presence_of :title  
  validates_uniqueness_of :title
  validates :title, :length => { :minimum => 3 }  
  validates_presence_of :content
  validates_presence_of :author  
  validates :content, :length => { :minimum => 10 }
  
  belongs_to :author, :class_name => "User", :inverse_of => :news
end
