class LocationsController < ApplicationController
  # GET /locations
  # GET /locations.xml
  def index
    @locations = Location.all
    respond_with(@locations)
  end

  # GET /locations/1
  # GET /locations/1.xml
  def show
    @location = Location.find(params[:id])
    respond_with(@location)
  end

  # GET /locations/new
  # GET /locations/new.xml
  def new
    @location = Location.new
    respond_with(@location)
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.xml
  def create
    @location = Location.new(params[:location])
    @location.save
    respond_with(@location)
  end

  # PUT /locations/1
  # PUT /locations/1.xml
  def update
    @location = Location.find(params[:id])
    @location.update_attributes(params[:location])
    respond_with(@location)
  end

  # DELETE /locations/1
  # DELETE /locations/1.xml
  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    respond_with(@location)
  end
end
