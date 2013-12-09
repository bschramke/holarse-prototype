class DiscountEvent < ActiveRecord::Base

  before_save :save_revision, on: [:create, :update, :delete]

  alias_attribute :content, :description
  alias_attribute :title, :name

  has_many :comments, as: :commentable
  has_many :revisions, as: :historical
  belongs_to :user

  validates_presence_of :name

  default_scope { where(enabled: true) }

  protected

  def save_revision
    self.revisions << Revision.new(changedset: self.to_json, user: self.user)
  end
end
