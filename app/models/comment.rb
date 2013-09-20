class Comment < ActiveRecord::Base
	attr_accessible :user, :content

	# referenzen
	belongs_to :user
	belongs_to :commentable, polymorphic: true

	# validierungen
	validates_presence_of :user
	validates_presence_of :content

	default_scope where(enabled: true)
end
