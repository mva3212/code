class Post < ActiveRecord::Base
extend FriendlyId
  friendly_id :name, use: [:slugged,:history]
  
  resourcify
  belongs_to :journal
	belongs_to :user
	has_many :comments
  attr_accessible :content, :name, :journal_id, :user_id
  
end
