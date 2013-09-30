class User < ActiveRecord::Base
    attr_accessible :username, :email, :signature, :jabber, :icq, :twitter, :diaspora, :steam, :homepage, :city, :job, :birthday, :computer, :graphics, :distro, :minecraft_username, :password, :password_confirmation, :avatar

    has_secure_password

    # references
    has_and_belongs_to_many :roles
    has_many :articles
    has_many :article_histories
    has_many :news
    has_many :discount_events
    has_many :comments

    # der benutzer-avatar
    has_attached_file :avatar, :default_url => '/assets/nobody.png'

    # validierungen
    validates_presence_of :username, :email
    validates_uniqueness_of :username, :email
#    validates_uniqueness_of :minecraft_username
    validates_presence_of :password, :on => :create

    validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }

    def do_authenticate(password)
      if self.old_password_hash.present? && old_password_is_correct(password)
	self.old_password_hash = nil
	self.password = password
      end

      authenticate(password)
    end

    def login_allowed
      self.active && !self.has_too_many_failed_logins()
    end

    def register_successfull_login
        self.failed_logins = 0
        self.lastlogin = DateTime.now
    end
    
    def increment_failed_logins
        self.increment(:failed_logins)
    end

    def has_too_many_failed_logins
      self.failed_logins > 3
    end

    def self.last_actives
      User.where("lastactivity > ?", 5.minutes.ago)
    end

    private

    def old_password_is_correct(old_password)
        Digest::MD5.hexdigest(old_password) == self.old_password_hash
    end
end
