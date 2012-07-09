class CropStrain < ActiveRecord::Base  
	extend FriendlyId
  friendly_id :name, use: [:slugged,:history]
  resourcify
  belongs_to :crop_type
  attr_accessible :crop_type_id, :description, :extra_info, :name
end
