class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  before_save :save_revision, on: [:create, :update, :delete]

  # validierungen
  validates_presence_of :title, :content, :user
  validates_uniqueness_of :title

  # referenzen
  belongs_to :user
  has_many :videos, as: :videoable
  has_many :revisions, as: :historical

  has_many :comments, as: :commentable

  belongs_to :project_activity_state

  acts_as_taggable_on :categories, :genres

  searchkick language: "German", word_middle: [:title]

  def search_data
    as_json only: [:title, :alternate_title, :content]
  end

  def should_index?
    enabled
  end

  def self.sk_search(term, limit=100)
    search(term, fields: [{title: :word_middle}, :alternate_title, :content], limit: limit).map(&:decorate)
  end

  def self.autosuggest(term)
    sk_search(term, 5).map { |s|
      {
	"title" => s.title,
	"secondary_title" => s.secondary_title,
	"icon" => s.icon,
	"accuracy" => 0,
	"url" => s.link_to
      }
    }
  end

  default_scope { where(enabled: true) }

end
