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
  field :twitter
  
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
  
  field :favourite_games, :type => Array, :default => []
  field :roles, :type => Array, :default => []
  
  field :last_login, :type => DateTime
  field :last_activity, :type => DateTime
  
  field :failed_logins, :type => Integer, :default => 0
  
  slug :username, :history => true
  
  has_mongoid_attached_file :avatar, :default_url => '/assets/nobody.png'
  
  has_many :articles, :inverse_of => :author
  has_many :news, :inverse_of => :author  
   
  index({username: 1}, {unique: true})  
  index({email: 1}, {unique: true})
  
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
  validates_length_of :username, :within => 2..30
  validates_length_of :signature, :within => 0..1024
  validates_length_of :city, :within => 0..100
  validates_length_of :computer, :within => 0..30
  validates_length_of :minecraft_username, :within => 0..30
  validates_length_of :desura, :within => 0..30
  validates :failed_logins, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 3 }  
  
  #validates_presence_of :minecraft_username, :if => Proc.new { |u| u.minecraft_active }
    
  def authenticate_legacy(old_password)
    Digest::MD5.hexdigest(old_password) == old_password_hash
  end
    
end
