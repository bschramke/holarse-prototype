class Article < ActiveRecord::Base

    has_paper_trail :only => [:title, :alternate_title, :content, :unreleased, :releaseddate]

    attr_accessible :title, :alternate_title, :content, :unreleased, :releasedate, :category_list, :genre_list, :comment, :project_activity_state_id

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

    has_many :comments, as: :commentable
    belongs_to :project_activity_state

    acts_as_taggable_on :categories, :genres

    default_scope where(enabled: true)
end

