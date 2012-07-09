class HarvestDetails < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: [:slugged,:history] 
  resourcify
  belongs_to :crop
  belongs_to :yield_unit 
  attr_accessible :harvest_date, :crop_id, :name, :notes, :summary, :total_dry_yield, :total_wet_yield, :yield_unit_id
end
