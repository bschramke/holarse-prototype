class Inbox < ActiveRecord::Base

  default_scope { where(active: true).order("created_at DESC") }

  validates_uniqueness_of :url

end
