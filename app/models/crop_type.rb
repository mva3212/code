class CropType < ActiveRecord::Base
  resourcify
  attr_accessible :description, :name
end
