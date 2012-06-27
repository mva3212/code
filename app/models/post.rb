class Post < ActiveRecord::Base
  resourcify
  belongs_to :journal
  attr_accessible :content, :name, :journal_id
end
