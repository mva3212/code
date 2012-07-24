class Country < ActiveRecord::Base
  resourcify
  attr_accessible :code, :name
  
  def self.build(code,name)
        this = Country.new();
		this.code = code;
		this.name = name; 
		return this
   end
end
