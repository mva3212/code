class JournalFarm < ActiveRecord::Base 
  resourcify
  belongs_to :farm
  belongs_to :journal
  attr_accessible :farm_id, :journal_id
end
