class User < ActiveRecord::Base
  has_secure_password
  has_many :board_games
  
  validates_presence_of :username, :password_digest

end