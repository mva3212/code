class Farm < ActiveRecord::Base
  resourcify
  belongs_to :state
  belongs_to :region
  belongs_to :user 
  attr_accessible :description, :name, :region_id, :state_id, :user_id
end
