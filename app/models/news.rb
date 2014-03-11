class News < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  before_save :save_revision, on: [:create, :update, :delete]

  belongs_to :user
  has_and_belongs_to_many :screenshots
  has_and_belongs_to_many :attachments  
  has_and_belongs_to_many :videos
  has_and_belongs_to_many :links
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

  searchkick language: "German"

  def search_data
    as_json only: [:title, :content, :subtitle]
  end

  def should_index?
    enabled
  end

  default_scope { where(enabled: true) }

end
