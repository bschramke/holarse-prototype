class News
  include Mongoid::Document  
  include Mongoid::Timestamps
  include Mongoid::FullTextSearch
  include Mongoid::Slug  

  field :title
  field :subtitle  
  field :content
  field :tags, :type => Array, :default => ["News"]
  field :disabled, :type => Boolean, :default => false
  field :frozen, :type => Boolean, :default => false

  field :changelog

  slug :title, :history => true  
  
  fulltext_search_in :title, :subtitle, :content, :index_name => 'nodes',
                   :filters => { :is_not_disabled => lambda { |x| !x.disabled }}
  
  embeds_many :screenshots, :cascade_callbacks => true
  embeds_many :attachments  
  embeds_many :videos
  embeds_many :newsupdates
  embeds_many :links
  embeds_many :comments

  accepts_nested_attributes_for :videos

  accepts_nested_attributes_for :links, :reject_if => lambda { |a| a[:url].blank? }, :allow_destroy => true

  accepts_nested_attributes_for :screenshots, :reject_if => lambda { |a| a[:img].blank? }, :allow_destroy => true

  
  validates_presence_of :title  
  validates :title, :length => { :minimum => 3 }  
  validates_presence_of :content
#  validates_presence_of :changelog
  #validates_presence_of :author  
  #validates :content, :length => { :minimum => 10 }
  
  belongs_to :author, :class_name => "User", :inverse_of => :news
  
  index({ title: 1 })
  index({ tags: 1 })
  
  def self.search(type, q)
    case type
    when :tags
      News.where(:tags => /#{q}/i)
    when :content
      News.fulltext_search(q, { :max_results => 30 })
    else
      raise "Invalid search type"
    end
  end
  
end
