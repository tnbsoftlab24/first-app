class User < ApplicationRecord

  has_many :shops
  
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable,:database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  after_create :send_welcome_email  
  private
  def send_welcome_email
    Usermailer.welcome_email(self).deliver
  end 
end
