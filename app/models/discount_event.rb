class DiscountEvent < ActiveRecord::Base

  has_paper_trail :only => [:name, :description, :startdate, :enddate, :website, :sourceurl]

  alias_attribute :content, :description
  alias_attribute :title, :name

  attr_accessible :name, :description, :startdate, :enddate, :website, :sourceurl

  has_many :comments, as: :commentable
  belongs_to :user

  validates_presence_of :name

  default_scope where(enabled: true)

end
