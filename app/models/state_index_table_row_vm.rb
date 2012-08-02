class StateIndexTableRowVm  
	def initialize(code, name, countryname, stateid, candelete)
      @code = code      
	  @name = name
      @country_name = countryname
      @state_id = stateid
	  @can_delete = candelete
   end
   attr_reader :code, :name, :country_name, :state_id, :can_delete
end
