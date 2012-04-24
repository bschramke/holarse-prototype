class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip  

  field :title
  field :content
  field :alternatives, :type => Array
  field :tags, :type => Array
  field :disabled, :type => Boolean, :default => false
  field :frozen, :type => Boolean, :default => false
  field :reviseme, :type => Boolean, :default => false
  field :releasedate, :type => DateTime
  field :ftp, :type => Boolean, :default => false
  field :nouploads, :type => Boolean, :default => false
  field :redirection
  
  belongs_to :author, :class_name => "User", :inverse_of => :articles
  embeds_many :onlineshops
  
  validates_presence_of :title
  validates_presence_of :content
  validates_presence_of :author
  validates_presence_of :tags
  
end
