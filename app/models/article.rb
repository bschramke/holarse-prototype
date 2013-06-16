class Article < ActiveRecord::Base
    attr_accessible :title, :alternate_title, :content, :unreleased, :releasedate, :user

    # validierungen
    validates_presence_of :title, :content, :user

    # self-referenz zum tracken von histories
    has_many :archived, :class_name => "Article", :foreign_key => "parent_id", :conditions => { :historical => true }
    belongs_to :article, :class_name => "Article"


    # referenzen
    belongs_to :user
    has_and_belongs_to_many :screenshots
    has_and_belongs_to_many :videos
    has_and_belongs_to_many :links
    has_and_belongs_to_many :attachments
    has_many :discount_events

    has_and_belongs_to_many :comments

    acts_as_taggable

    default_scope where(:historical => false)
    default_scope where(:enabled => true)

    amoeba do
      enable
      exclude_field [:screenshots, :attachments, :videos, :links, :comments, :discount_events]
      set :historical => true
      customize([
        lambda do |orig_obj,copy_of_obj|
          copy_of_obj.parent_id = orig_obj.id
        end
      ])
    end

end

