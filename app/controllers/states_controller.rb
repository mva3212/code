class StatesController < ApplicationController
  # GET /states
  # GET /states.json
  def index 
     
  end

  
  def getdata    
	displaystart = Integer(params[:iDisplayStart]) 
	displaylength = Integer(params[:iDisplayLength]) 
	 
	sortcol = params[:sColumns].split(",")[Integer(params[:iSortCol_0])]
	 
	puts params[:sSortDir_0]
	
	
	filteredstates = State.FilterBy(params[:Filter])
    
	 
	
    pagedorderedstates = State.FilterByOrderPage(params[:Filter],sortcol,params[:sSortDir_0],(1+(displaystart/displaylength)),displaylength)
	
	state_vms = Array.new	
	 
	pagedorderedstates.each do |state| 
	      
		country = Country.find(state.country_id) 
		  
		vm = StateIndexTableRowVm.new(state.code,state.name,country.name,state.id,true)
		  
		state_vms.push(vm)
	end 
	 
    data = Hash.new
    #pagination - see doc
    data["sEcho"] = params[:sEcho]
    data["iTotalRecords"] =filteredstates.size
    data["iTotalDisplayRecords"] = filteredstates.size
    data["aaData"] = state_vms.as_json
    
	render :json => data.to_json
  end
   
  # GET /states/new
  # GET /states/new.json
  def new
     
  end
 
  def edit 
    @state = State.find(params[:id])
  end

  # POST /states
  # POST /states.json
  def create 
  
	puts params[:country]
	country = Country.where(:code => params[:country]).first
	
	puts country
	countryId = country.id
   
	puts countryId
	
    @state = State.new :code => params[:code], :name => params[:name], :country_id => countryId
    
    respond_to do |format|
      if @state.save
        format.html { redirect_to(:action => "index") }
      else
        format.html { render action: "new" } 
      end
    end
  end

  # PUT /states/1
  # PUT /states/1.json
  def update
   
   puts params
    @state = State.find(params[:targetId])
 
    data = Hash.new
    #pagination - see doc
    data["code"] = params[:code]  
    data["name"] = params[:name]   
    data["countryId"] = params[:countryId]   
	
    respond_to do |format|
      if @state.update_attributes(data)
        format.html { redirect_to(:action => "index") }
      else 
	    puts @state.errors
        format.html { redirect_to(:action => "edit", :id => (params[:targetId])) }
      end
    end
  end

  # DELETE /states/1
  # DELETE /states/1.json
  def destroy
	
	puts params[:id]
  
    state = State.find(params[:id])
	
	puts state
	
    state.destroy 
	
    redirect_to(:action => "index")  
  end
end
