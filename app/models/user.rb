require 'bcrypt'

class User < ActiveRecord::Base
  validates :username, :email, :hashed_password, presence: true
  validates_format_of :email, :with => /@/

  has_many :favorites
  has_many :destinations, through: :favorites

  def password
  	@password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
  	@password = BCrypt::Password.create(new_password)
  	self.hashed_password = @password
  end

  def self.authenticate(params = {})
  	user = self.find_by(email: params[:email])
  	return user if user && user.password == params[:password]
  	nil
  end
end
