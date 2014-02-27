class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  before_save :save_revision, on: [:create, :update, :delete]

  # validierungen
  validates_presence_of :title, :content, :user
  validates_uniqueness_of :title

  # referenzen
  belongs_to :user
  has_and_belongs_to_many :screenshots
  has_and_belongs_to_many :videos
  has_and_belongs_to_many :links
  has_and_belongs_to_many :attachments
  has_many :revisions, as: :historical

  has_many :comments, as: :commentable

  belongs_to :project_activity_state

  acts_as_taggable_on :categories, :genres

  default_scope { where(enabled: true) }

  scope :search, ->(q, limit=200) { where("content like ? or title like ? or alternate_title like ?", q, q, q).limit(limit) }

end
