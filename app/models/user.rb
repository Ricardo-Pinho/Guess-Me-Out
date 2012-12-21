class User < ActiveRecord::Base

  attr_accessor :password

  before_save :encrypt_password
  before_update :encrypt_password
  after_update :clear_password
  after_save :clear_password

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :admin, :presence => true
  validates :credits, :presence => true, :numericality => true
  validates :password, :confirmation => true
  #Only on Create so other actions like update password attribute can be nil
  validates_length_of :password, :in => 6..20, :on => :create
  validates_length_of :password, :in => 6..20, :allow_blank => true, :on => :update
  attr_accessible :username, :email, :password, :password_confirmation, :name, :birthdate, :sex, :location, :credits, :last_login, :admin, :authentication

  def self.authenticate(username_or_email="", login_password="")

    if  EMAIL_REGEX.match(username_or_email)    
      user = User.find_by_email(username_or_email)
    else
      user = User.find_by_username(username_or_email)
    end

    if user && user.match_password(login_password)
	  time=Time.new
	  user.update_attribute(:last_login, time.strftime("%Y-%m-%d %H:%M:%S"))
      return user
    else
      return false
    end
  end   

  def match_password(login_password="")
    encrypted_password == Digest::MD5.hexdigest(login_password)
  end



  def encrypt_password
    unless password.blank?
      self.encrypted_password = Digest::MD5.hexdigest(password)
    end
  end

  def clear_password
    self.password = nil
  end

end
