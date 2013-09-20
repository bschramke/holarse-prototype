class DiscountEvent < ActiveRecord::Base
  attr_accessible :name, :description, :startdate, :enddate, :website, :sourceurl

  has_many :comments, as: :commentable
  belongs_to :user

  validates_presence_of :name

end
