class JournalCrop < ActiveRecord::Base 
  resourcify
  belongs_to :crop
  belongs_to :journal
  attr_accessible :crop_id, :journal_id
end
