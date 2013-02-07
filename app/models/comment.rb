class Comment < ActiveRecord::Base
	attr_accessible :user, :content

	# referenzen
	belongs_to :user
	has_and_belongs_to_many :news
  belongs_to :article

	# validierungen
  validates_presence_of :user
	validates_presence_of :content
end
