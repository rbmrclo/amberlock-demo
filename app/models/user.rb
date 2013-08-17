class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :mobile, :enabled
  # attr_accessible :title, :body
  #
  # after_save :subscribe_user

  def subscribe!(mobile_no)
    amberlock = Amberlock.new
    self.enabled = true
    self.mobile = mobile_no
    self.save!
    amberlock.subscribe_user(mobile, email)
  end

end
