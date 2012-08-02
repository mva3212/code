class CountriesController < ApplicationController
 # GET /countries
  # GET /countries.json
  def index 
     
  end

  def getdata 
	@allcountries = Country.all   
		 
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
	 
  end

# def show  
#  	@country = Country.find(params[:id])  
#  	respond_with @country  
# end 

  def edit 
    @country = Country.find(params[:id])
  end
 
def create
	puts params
    @country = Country.new :code => params[:code], :name => params[:name] 
	
    respond_to do |format|
      if @country.save
        format.html { redirect_to(:action => "index") }
      else
        format.html { render action: "new" }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /countries/1
  # PUT /countries/1.json
  def update
   puts params
    @country = Country.find(params[:targetId])
 
    data = Hash.new 
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
