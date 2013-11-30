class Revision < ActiveRecord::Base
  attr_accessible :changedset, :user

  validates_presence_of :changedset, :user

  belongs_to :user

  def original
    self.historical_type.constantize.new(self.changedset)
  end
end
