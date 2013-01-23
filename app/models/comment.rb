class Comment < ActiveRecord::Base
	attr_accessible :user, :content

	# referenzen
	belongs_to :user
	belongs_to :comment

	# validierungen
	validates_presence_of :content
end
