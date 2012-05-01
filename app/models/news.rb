class News
  include Mongoid::Document  
  include Mongoid::Timestamps
  include Mongoid::Paperclip  

  field :title
  field :subtitle  
  field :content
  field :tags, :type => Array
  field :disabled, :type => Boolean, :default => false
  field :frozen, :type => Boolean, :default => false

  validates_presence_of :title  
  validates_presence_of :content
  validates_presence_of :author  
  
  belongs_to :author, :class_name => "User", :inverse_of => :news
end
