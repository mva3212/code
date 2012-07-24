class StatesController < ApplicationController
  # GET /states
  # GET /states.json
  def index 
     
  end

  
  def getdata 
		@allstates = State.all 
	 
    data = Hash.new
    #pagination - see doc
    data["sEcho"] = params[:sEcho]
    data["iTotalRecords"] =@allstates.size
    data["iTotalDisplayRecords"] = @allstates.size
    data["aaData"] = @allstates.as_json
   
	render :json => data.to_json
  end
   
  # GET /states/new
  # GET /states/new.json
  def new
    @state = State.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @state }
    end
  end

 
  def edit
	puts params[:id]
    @state = State.find(params[:id])
  end

  # POST /states
  # POST /states.json
  def create
	puts params
    @state = State.new :code => params[:code], :name => params[:name], :country_id => params[:countryId]
    
    respond_to do |format|
      if @state.save
        format.html { redirect_to(:action => "index") }
      else
        format.html { render action: "new" }
        format.json { render json: @state.errors, status: :unprocessable_entity }
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
    @state = State.find(params[:id])
    @state.destroy 
    redirect_to(:action => "index")  
  end
end
