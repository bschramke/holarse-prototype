class News
  include Mongoid::Document  
  include Mongoid::Timestamps
  include Mongoid::FullTextSearch
  include Mongoid::Slug  

  field :title
  field :subtitle  
  field :content
  field :tags, :type => Array
  field :disabled, :type => Boolean, :default => false
  field :frozen, :type => Boolean, :default => false

  field :changelog

  slug :title, :history => true  
  
  fulltext_search_in :title, :subtitle, :content, :index_name => 'nodes',
                   :filters => { :is_not_disabled => lambda { |x| !x.disabled }}
  
  embeds_many :screenshots  
  embeds_many :attachments  
  embeds_many :videos
  embeds_many :newsupdates
  embeds_many :links
  embeds_many :comments

  accepts_nested_attributes_for :videos

  
  validates_presence_of :title  
  validates :title, :length => { :minimum => 3 }  
  validates_presence_of :content
#  validates_presence_of :changelog
  #validates_presence_of :author  
  #validates :content, :length => { :minimum => 10 }
  
  belongs_to :author, :class_name => "User", :inverse_of => :news
  
  index :title
  index :tags
  
  def self.search(q)
    News.fulltext_search(q, { :max_results => 30 })
  end
  
end
