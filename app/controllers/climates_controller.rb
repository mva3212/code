class ClimatesController < ApplicationController
  # GET /climates
  # GET /climates.json
  def index 
    #respond_to do |format|
     # format.html # index.html.erb
    #  format.json { render json: @climates }
    #end
  end

  
  def getdata 
	@allclimates = Climate.all 
	  
    data = Hash.new
    #pagination - see doc
    data["sEcho"] = params[:sEcho]
    data["iTotalRecords"] = @allclimates.size
    data["iTotalDisplayRecords"] = @allclimates.size
    data["aaData"] = @allclimates.as_json
   
	puts data.to_json
	
	render :json => data.to_json
  end
  
  # GET /climates/new
  # GET /climates/new.json
  def new  
      
  end

 
  def edit
	puts params[:id]
    @climate = Climate.find(params[:id])
  end

  # POST /climates
  # POST /climates.json
  def create
  
	puts params
	
    @climate = Climate.new :code => params[:code], :name => params[:name], :description => params[:description]

    respond_to do |format|
      if @climate.save
        format.html { redirect_to(:action => "index") }
      else
        format.html { render action: "new" }
        format.json { render json: @climate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /climates/1
  # PUT /climates/1.json
  def update
   
   puts params
    @climate = Climate.find(params[:targetId])
 
    data = Hash.new
    #pagination - see doc
    data["code"] = params[:code]  
    data["name"] = params[:name]  
    data["description"] = params[:description]  
	
    respond_to do |format|
      if @climate.update_attributes(data)
        format.html { redirect_to(:action => "index") }
      else 
	    puts @climate.errors
        format.html { redirect_to(:action => "edit", :id => (params[:targetId])) }
      end
    end
  end

  # DELETE /climates/1
  # DELETE /climates/1.json
  def destroy
    @climate = Climate.find(params[:id])
    @climate.destroy 
    redirect_to(:action => "index")  
  end
end
