class State < ActiveRecord::Base
  resourcify 
  attr_accessible :code, :name, :country_id 
	belongs_to :country
	
   def self.FilterBy(filter) 
   
	   states = Array.new
	   
	   if(filter==nil || filter == '') 
			states =  State.all
			
	   else 
			states = State.where('code LIKE ? OR name LIKE ?', "%#{filter}%","%#{filter}%") 
	   end
			puts "STATES"
			puts states
			
			return states
		
	end
	
	def self.FilterByOrderPage(filter,sortcol,sortdir,pagenum,pagelength) 
   
	   states = Array.new
	 
	   colorder = sortcol.downcase << " " << sortdir.upcase
	    
	   if(filter==nil || filter == '') 
		
			states =  State.order(colorder).paginate(:page => pagenum, :per_page => pagelength) 
	   else 
			states = State.where('code LIKE ? OR name LIKE ?', "%#{filter}%","%#{filter}%").order(colorder).paginate(:page => pagenum, :per_page => pagelength) 
	   end
		  
			return states
		
	end
	 

end
