class Article < ActiveRecord::Base
  before_save :save_revision, on: [:create, :update, :delete]

  # validierungen
  validates_presence_of :title, :content, :user

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

  def self.search(q, limit=200)
    # TODO in einen scope umwandeln
    where("content like ? or title like ? or alternate_title like ?", q, q, q).limit(limit)
  end

  protected

  def save_revision
    self.revisions << Revision.new(changedset: self.to_json, user: self.user, event: self.new_record? ? "create" : "update")
  end
end

