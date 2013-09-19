class DiscountEvent < ActiveRecord::Base
  attr_accessible :name, :description, :startdate, :enddate, :website, :sourceurl

  belongs_to :user

  validates_presence_of :name

end
