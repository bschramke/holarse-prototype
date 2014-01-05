class Draft < ActiveRecord::Base
  validates_presence_of :user, :draftedtext

  belongs_to :draftable, polymorphic: true
  belongs_to :user

end
