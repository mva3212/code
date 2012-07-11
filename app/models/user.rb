class User < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: [:slugged,:history]
  
  rolify

	after_create :default_role

  private
  def default_role
    self.add_role(:default)
  end
	
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
end
