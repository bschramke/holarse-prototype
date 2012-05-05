class Article
  include Mongoid::Document
  include Mongoid::Timestamps

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
  field :historical, :type => Boolean, :default => false
  
  belongs_to :author, :class_name => "User", :inverse_of => :articles
  embeds_many :onlineshops
  embeds_many :screenshots
  embeds_many :attachments  
  embeds_many :videos    
  embeds_many :links
  embeds_many :comments

  embeds_one :crossover
  embeds_one :wine
  
  validates_presence_of :title  
  validates_uniqueness_of :title
  validates :title, :length => { :minimum => 3 }    
  validates_presence_of :content
  validates :content, :length => { :minimum => 10 } 
  validates_presence_of :author
  validates_presence_of :tags

  validate :keep_frozen_article
  validate :keep_disabled_article
  
  index :title, :unqiue => true
  index :tags
  
  def keep_frozen_article
    errors.add(:title, "is not allowed to change") if (frozen_changed? && author.present? && !author.roles.include?("admin"))
  end
  
  def keep_disabled_article
    errors.add(:title, "is not allowed to change") if (disabled_changed? && author.present? && !author.roles.include?("admin"))
  end
  
end
