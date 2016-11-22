require 'bcrypt'

class User < ActiveRecord::Base

  has_secure_password
  validates :password, confirmation: true

end