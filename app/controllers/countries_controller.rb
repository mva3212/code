class CountriesController < ApplicationController
 # GET /countries
  # GET /countries.json
  def index 
     
  end

  def getdata 
		@allcountries = Country.all   
		#I'm not sure why this object is being built in the controller. seems it would be more efficient and 
		#easier to read if this was moved and done in the generic JS file dt_bootstrap
		#If this is done this action becomes simply :
		# @allcountries = Country.all
		# respond_with(@allcountries)
		# I think the benefits are obvious but let me know if you disagree. - mike
    data = Hash.new
    #pagination - see doc
    data["sEcho"] = params[:sEcho]
    data["iTotalRecords"] = @allcountries.size
    data["iTotalDisplayRecords"] = @allcountries.size
    data["aaData"] = @allcountries.as_json
		respond_with(data) # respond with should be used in preference to render :json
  end
   
  # GET /countries/new
  # GET /countries/new.json
  def new
    @country = Country.new
    respond_with(@country)
  end

 	def show  
  	@country = Country.find(params[:id])  
  	respond_with @country  
	end 

  def edit
		puts params[:id]
    @country = Country.find(params[:id])
  end

  # POST /countries
  # POST /countries.json
  def create
    @country = Country.new(:code => params[:code], :name => params[:name]) #this should be simplified in the form. see form for details.
		@country.save
		respond_with(@country) do |format|
			format.html { redirect_to :controller=>"countries", :action => "index" }
		end
  end

  # PUT /countries/1
  # PUT /countries/1.json
  def update
   puts params
    @country = Country.find(params[:targetId])
 
    data = Hash.new
    #pagination - see doc
    data["code"] = params[:code]  
    data["name"] = params[:name]   
	
    respond_to do |format|
      if @country.update_attributes(data)
        format.html { redirect_to(:action => "index") }
      else 
	    puts @country.errors
        format.html { redirect_to(:action => "edit", :id => (params[:targetId])) }
      end
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @country = Country.find(params[:id])
    @country.destroy 
    redirect_to(:action => "index")  
  end
end
