class DiscountEvent < ActiveRecord::Base

  before_save :save_revision, on: [:create, :update, :delete]

  alias_attribute :content, :description
  alias_attribute :title, :name

  has_many :videos, as: :videoable
  has_many :comments, as: :commentable
  has_many :revisions, as: :historical
  belongs_to :user

  validates_presence_of :name

  default_scope { where(enabled: true) }
  
  searchkick language: "German", word_middle: [:title]

  def self.sk_search(term, limit=100)
    search(term, fields: [{title: :word_middle}, :content], limit: limit).map(&:decorate)
  end

  def search_data
    as_json only: [:title, :content]
  end

  def should_index?
    enabled
  end

  protected

  def save_revision
    self.revisions << Revision.new(changedset: self.to_json, user: self.user)
  end
end
