class Journal < ActiveRecord::Base
  resourcify
  belongs_to :user
  belongs_to :journal_type
  attr_accessible :description, :is_primary, :name, :user_id, :journal_type_id
end
