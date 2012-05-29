class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  include Mongoid::Timestamps
  include Mongoid::Paperclip
  include Mongoid::Slug
  
  has_secure_password

  attr_protected :roles # avoid mass-assignment
  
  field :username
  field :email
  field :active, :type => Boolean, :default => true
  field :twitteruser
  
  field :old_password_hash
  field :password_digest
  
  field :signature
  field :jabber
  field :icq
  
  field :city
  field :job
  field :birthday, :type => DateTime
  field :computer
  field :graphics
  field :distro
  field :minecraft_whitelisted, :type => Boolean
  field :minecraft_username
  field :desura
  
  field :favourite_games, :type => Array
  field :roles, :type => Array, :default => []
  
  field :last_activity, :type => DateTime, :default => Time.now
  
  slug :username, :history => true
  
  has_mongoid_attached_file :avatar, :default_url => '/assets/nobody.svg'
  
  has_many :articles, :inverse_of => :author
  has_many :news, :inverse_of => :author  
  embeds_many :karmas, :inverse_of => :author
  
  index :username, :unqiue => true  
  index :email, :unqiue => true    
  
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
  validates_length_of :username, :within => 2..30
  validates_length_of :signature, :within => 0..1024
  validates_length_of :city, :within => 0..30
  validates_length_of :computer, :within => 0..30
  validates_length_of :minecraft_username, :within => 0..30
  validates_length_of :desura, :within => 0..30
  validates :twitteruser, :format => { :with => /(@\w+)/, :message => "Valid Twitter-Account required" }
  
  #validates_presence_of :minecraft_username, :if => Proc.new { |u| u.minecraft_active }
  
  def authenticate_legacy(old_password)
    active && Digest::MD5.hexdigest(old_password) == old_password_hash
  end
  
  def do_authenticate(password)
    active && authenticate(password)
  end
  
  def migrate_password(old_password)
    if old_password_hash.empty?
      fail("No legacy password given to migrate")
    end
    self.old_password_hash = nil
    self.password = old_password
  end
  
  def touch
    self.last_activity = DateTime.now
  end
  
end
