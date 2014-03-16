class News < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  before_save :save_revision, on: [:create, :update, :delete]

  belongs_to :user
  has_many :videos, as: :videoable
  has_many :comments, as: :commentable
  belongs_to :news_category

  # self-referenz zum tracken von histories
  has_many :revisions, as: :historical
  has_many :news_updates

  acts_as_taggable_on :categories

  validates_presence_of :title  
  validates :title, :length => { :minimum => 3 }  
  validates_presence_of :content
  validates_presence_of :user  
  validates :content, :length => { :minimum => 10 }

  searchkick language: "German", word_middle: [:title]

  def self.sk_search(term, limit=100)
    search(term, fields: [{title: :word_middle}, :subtitle, :content], limit: limit).map(&:decorate)
  end

  def search_data
    as_json only: [:title, :content, :subtitle]
  end

  def should_index?
    enabled
  end

  default_scope { where(enabled: true) }

end
