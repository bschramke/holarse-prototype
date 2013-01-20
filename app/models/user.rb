class User < ActiveRecord::Base

    has_and_belongs_to_many :roles

    # der benutzer-avatar
    has_attached_file :avatar, :default_url => '/assets/nobody.png'

    validates_presence_of :username, :email
    validates_uniqueness_of :username, :email

end
