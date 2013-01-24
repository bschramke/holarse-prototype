class News < ActiveRecord::Base
  
  belongs_to :user
  has_many :screenshots
  has_many :attachments  
  has_many :videos
  has_many :links
  has_many :comments

  acts_as_taggable

  validates_presence_of :title  
  validates :title, :length => { :minimum => 3 }  
  validates_presence_of :content
  validates_presence_of :user  
  validates :content, :length => { :minimum => 10 }
  
end
