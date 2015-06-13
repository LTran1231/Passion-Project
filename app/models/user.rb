class User < ActiveRecord::Base
	include BCrypt

	before_save { email.downcase! }

	validates :name, presence: true,  length: { maximum: 50 }
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence:   true, 
										format: 	  { with: VALID_EMAIL_REGEX },
										uniqueness: { :case_sensitive => false }

	has_secure_password
	validates :password, length: { minimum: 6 }


  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end

# HAS_SECURE_PASSWORD
# password must be presence
# password length must be less than or equal to 72 characters
# confirmation of password that is build in with "password_confirmation" attribute



