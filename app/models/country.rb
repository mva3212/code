class Country < ActiveRecord::Base
  resourcify
  attr_accessible :code, :name
end
