class State < ActiveRecord::Base
  resourcify
  belongs_to :country
  attr_accessible :code, :name, :country_id 
end
