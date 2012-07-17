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
	validates_presence_of :name, :email, :password, :password_confirmation
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :street, :city, :state_id,
	 :zip, :country_id, :country,  :latitude, :longitude
  belongs_to :state
	belongs_to :country
	
	def address
 	 [street, city, state, zip, country].compact.join(', ')
	end
	def address_changed?
 	 street_changed? || city_changed? || state_changed? ||  zip_changed || country_changed?
	end

  geocoded_by :address
  after_validation :geocode, :if => :address_changed? 

end
