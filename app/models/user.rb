class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :admin
  has_secure_password
  validates_presence_of :password, :on => :create
end