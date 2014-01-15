class Draft < ActiveRecord::Base
  validates_presence_of :user, :draftedtext

  belongs_to :draftable, polymorphic: true
  belongs_to :user

  scope :for_user, ->(user) { where(user: user) }

  def reify
    draftable_type.constantize.new(ActiveSupport::JSON.decode(draftedtext))
  end

end
