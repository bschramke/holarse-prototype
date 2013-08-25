class News < ActiveRecord::Base
  
  belongs_to :user
  has_and_belongs_to_many :screenshots
  has_and_belongs_to_many :attachments  
  has_and_belongs_to_many :videos
  has_and_belongs_to_many :links
  has_and_belongs_to_many :comments

  # self-referenz zum tracken von histories
  has_many :archived, :class_name => "News", :foreign_key => "parent_id", :conditions => { :historical => true }
  belongs_to :news, :class_name => "News"

  accepts_nested_attributes_for :screenshots, :reject_if => lambda { |a| a[:image].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :videos, :reject_if => lambda { |a| a[:url].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :links, :reject_if => lambda { |a| a[:url].blank? }, :allow_destroy => true

  acts_as_taggable_on :categories

  validates_presence_of :title  
  validates :title, :length => { :minimum => 3 }  
  validates_presence_of :content
  validates_presence_of :user  
  validates :content, :length => { :minimum => 10 }

  default_scope where(:historical => false)
  default_scope where(:enabled => true)

  def self.searchable_language
    'german'
  end

  amoeba do
    enable
    exclude_field [:screenshots, :attachments, :videos, :links, :comments]
    set :historical => true
    customize([
      lambda do |orig_obj,copy_of_obj|
        copy_of_obj.parent_id = orig_obj.id
      end
    ])
  end

end
