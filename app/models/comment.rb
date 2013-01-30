class Comment < ActiveRecord::Base
	attr_accessible :user, :content

	# referenzen
	belongs_to :user
	belongs_to :news
  belongs_to :article

	# validierungen
  validates_presence_of :user
	validates_presence_of :content
end
