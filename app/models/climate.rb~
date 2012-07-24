class Climate < ActiveRecord::Base 
resourcify
  attr_accessible :code, :description, :name
  
  def self.build(code,name,desc)
        this = Climate.new();
		this.code = code;
		this.name = name;
		this.description = desc;
		return this
   end

end
