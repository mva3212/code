class State < ActiveRecord::Base
  resourcify 
  attr_accessible :code, :name, :country_id 
end
