class State < ActiveRecord::Base
  resourcify
  attr_accessible :code, :name
end
