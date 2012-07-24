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
   
	puts data.to_json
	
	render :json => data.to_json
  end
   
  # GET /countries/new
  # GET /countries/new.json
  def new
    @country = Country.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @country }
    end
  end

 
  def edit
	puts params[:id]
    @country = Country.find(params[:id])
  end

  # POST /countries
  # POST /countries.json
  def create
	puts params
    @country = Country.build(params[:code],params[:name]);

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
