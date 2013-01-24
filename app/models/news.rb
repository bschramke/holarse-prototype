class News < ActiveRecord::Base
  
  belongs_to :user
  has_many :screenshots
  has_many :attachments  
  has_many :videos
  has_many :links
  has_many :comments

  #accepts_nested_attributes_for :screenshots, :reject_if => lambda { |a| a[:image].blank? }, :allow_destroy => true
  #accepts_nested_attributes_for :videos, :reject_if => lambda { |a| a[:url].blank? }, :allow_destroy => true
  #accepts_nested_attributes_for :links, :reject_if => lambda { |a| a[:url].blank? }, :allow_destroy => true

  accepts_nested_attributes_for :screenshots
  accepts_nested_attributes_for :videos
  accepts_nested_attributes_for :links

  acts_as_taggable

  validates_presence_of :title  
  validates :title, :length => { :minimum => 3 }  
  validates_presence_of :content
  validates_presence_of :user  
  validates :content, :length => { :minimum => 10 }
  
end
