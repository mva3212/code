class Post < ActiveRecord::Base
extend FriendlyId
  friendly_id :name, use: [:slugged,:history]
  
  resourcify
  belongs_to :journal
  attr_accessible :content, :name, :journal_id 
  
end
