class Country < ActiveRecord::Base
  resourcify
  attr_accessible :code, :name
  has_many :states
end
