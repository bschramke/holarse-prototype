class User < ActiveRecord::Base
    attr_accessible :username, :email, :signature, :jabber, :icq, :twitter, :homepage, :city, :job, :birthday, :computer, :graphics, :distro, :minecraft_username, :password, :password_confirmation, :avatar

    has_secure_password

    # references
    has_and_belongs_to_many :roles

    # der benutzer-avatar
    has_attached_file :avatar, :default_url => '/assets/nobody.png'

    # validierungen
    validates_presence_of :username, :email
    validates_uniqueness_of :username, :email
#    validates_uniqueness_of :minecraft_username
    validates_presence_of :password, :on => :update

end
