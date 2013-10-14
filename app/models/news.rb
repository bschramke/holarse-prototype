class News < ActiveRecord::Base

  has_paper_trail :only => [:title, :subtitle, :content]

  attr_accessible :title, :subtitle, :news_category_id, :category_list, :content

  belongs_to :user
  has_and_belongs_to_many :screenshots
  has_and_belongs_to_many :attachments  
  has_and_belongs_to_many :videos
  has_and_belongs_to_many :links
  has_many :comments, as: :commentable
  belongs_to :news_category

  # self-referenz zum tracken von histories
  has_many :archived, :class_name => "News", :foreign_key => "parent_id", :conditions => { :historical => true }
  belongs_to :news, :class_name => "News"

  acts_as_taggable_on :categories

  validates_presence_of :title  
  validates :title, :length => { :minimum => 3 }  
  validates_presence_of :content
  validates_presence_of :user  
  validates :content, :length => { :minimum => 10 }

  default_scope where(enabled: true)

  def self.search(q, limit=200)
    where("content like ? or title like ? or subtitle like ?", q, q, q).limit(limit)
  end

end
