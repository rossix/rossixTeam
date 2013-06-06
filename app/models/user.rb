class User < ActiveRecord::Base
  has_many :events
  attr_accessible :crypted_password, :email, :firstname, :group_id, :login, :name, :remember_token, :remember_token_expires_at, :salt, :telnr
end
