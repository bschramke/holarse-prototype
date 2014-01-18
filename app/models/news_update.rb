class NewsUpdate < ActiveRecord::Base

  default_scope { order('created_at DESC') }

  belongs_to :news
  belongs_to :user

  validates_presence_of :news, :user

end
