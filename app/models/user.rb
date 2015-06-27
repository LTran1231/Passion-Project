class User < ActiveRecord::Base
	include BCrypt

  has_many :posts

	before_save { email.downcase! }

	validates :name, presence: true,  length: { maximum: 50 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence:   true,
										format: 	  { with: VALID_EMAIL_REGEX },
										uniqueness: { :case_sensitive => false }

	has_secure_password
	validates :password, length: { minimum: 6 }

	def self.create_from_facebook(access_token)
    profile = Facebook.user_profile(access_token)
    p "P" *100
    p profile
    name = "#{profile["first_name"]} #{profile["last_name"]}"
    email = "#{profile["email"]}"
    password = "#{profile["password"]}"
    p "N" *100
    p name 
    existing_user = self.where(email: email).first
    if existing_user
      return existing_user
    else
      self.create(facebook_token: access_token, name: name, email: email, password: password)
    end
  end

  def passwords
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end

