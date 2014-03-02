class User < ActiveRecord::Base
  extend FriendlyId
    friendly_id :username, use: :slugged

    has_secure_password(validations: false)

    # references
    has_and_belongs_to_many :roles
    has_many :articles
    has_many :revisions
    has_many :news
    has_many :discount_events
    has_many :comments

    # der benutzer-avatar
    has_attached_file :avatar, :default_url => '/assets/noavatar.png'

    # validierungen
    validates_presence_of :username, :email
    validates_uniqueness_of :username, :email
    validates_uniqueness_of :minecraft_username, allow_blank: true
    validates_presence_of :password, :on => :create, :if => Proc.new { |a| a.old_password_hash.nil? }

    #validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }

    def do_authenticate(password)
      return false if password.empty?
      Rails.logger.debug("password: #{password}")
      if self.old_password_hash.present?
	if old_password_is_correct(password)
	  self.old_password_hash = nil
	  self.password = password

	  Rails.logger.debug("user: #{self.inspect}")
        else
	  return false
	end
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

    def self.minecrafters
      User.where(:minecraft_whitelisted)
    end

    def valid_minecraft_account?
      self.minecraft_whitelisted and not self.minecraft_username.empty?
    end

    private

    def old_password_is_correct(old_password)
        Digest::MD5.hexdigest(old_password) == self.old_password_hash
    end
end
