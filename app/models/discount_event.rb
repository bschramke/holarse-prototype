class DiscountEvent < ActiveRecord::Base

  before_save :save_revision, on: [:create, :update, :delete]

  alias_attribute :content, :description
  alias_attribute :title, :name

  has_many :comments, as: :commentable
  has_many :revisions, as: :historical
  belongs_to :user

  validates_presence_of :name

  default_scope { where(enabled: true) }

  def self.search(q, limit=200)
    # TODO in einen scope umwandeln
    where("description like ? or name like ?", q, q).limit(limit)
  end

  protected

  def save_revision
    self.revisions << Revision.new(changedset: self.to_json, user: self.user)
  end
end
