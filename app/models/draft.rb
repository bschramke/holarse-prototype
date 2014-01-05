class Draft < ActiveRecord::Base
  validates_presence_of :user, :draftedtext, :merge_revision

  belongs_to :draftable, polymorphic: true

end
