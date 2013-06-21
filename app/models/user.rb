class User < ActiveRecord::Base
  has_many :events

  attr_accessible :crypted_password, :email, :firstname, :group_id, :login, :name, :remember_token, :remember_token_expires_at, :salt, :telnr, :password_confirmation, :password
  has_secure_password
  validates_presence_of :password, :on => :create



before_create { generate_token(:auth_token) }

 def send_password_reset
   generate_token(:password_reset_token)
   self.password_reset_sent_at = Time.zone.now
   save!
   UserMailer.password_reset(self).deliver
 end

 def generate_token(column)
   begin
     #self[column] = SecureRandom.urlsafe_base64
     self[column] = SecureRandom.hex
   end while User.exists?(column => self[column])
 end


end
