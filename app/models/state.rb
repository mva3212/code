class State < ActiveRecord::Base
  resourcify 
  attr_accessible :code, :name, :country_id 
	belongs_to :country
end
