class Crop < ActiveRecord::Base
  resourcify
  belongs_to :crop_strain
  belongs_to :farm
  attr_accessible :crop_strain_id, :description, :farm_id, :name, :planted_date, :seed_count
end
