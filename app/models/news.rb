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

  default_scope { where(enabled: true) }

  scope :search, ->(q, limit=200) { where("content like ? or title like ? or subtitle like ?", q, q, q).limit(limit) }

  protected

  def save_revision
    self.revisions << Revision.new(changedset: self.to_json, user: self.user, event: self.new_record? ? "create" : "update")
  end

end
