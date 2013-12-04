class Revision < ActiveRecord::Base
  validates_presence_of :changedset, :user

  belongs_to :user
  belongs_to :historical, polymorphic: true

  def original
    self.historical_type.constantize.new(ActiveSupport::JSON.decode(self.changedset))
  end
end
