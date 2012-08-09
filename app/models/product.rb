class Product < ActiveRecord::Base
  attr_accessible :description, :imgurl, :name, :price
end
