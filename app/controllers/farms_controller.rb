class FarmsController < ApplicationController
  # GET /farms
  # GET /farms.json
  def index
    @farms = Farm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @farms }
    end
  end

  # GET /farms/1
  # GET /farms/1.json
  def show
    @farm = Farm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @farm }
    end
  end

  # GET /farms/new
  # GET /farms/new.json
  def new
    @farm = Farm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @farm }
    end
  end

  # GET /farms/1/edit
  def edit
    @farm = Farm.find(params[:id])
  end

  # POST /farms
  # POST /farms.json
  def create
    @farm = Farm.new(params[:farm])

    respond_to do |format|
      if @farm.save
        format.html { redirect_to @farm, notice: 'Farm was successfully created.' }
        format.json { render json: @farm, status: :created, location: @farm }
      else
        format.html { render action: "new" }
        format.json { render json: @farm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /farms/1
  # PUT /farms/1.json
  def update
    @farm = Farm.find(params[:id])

    respond_to do |format|
      if @farm.update_attributes(params[:farm])
        format.html { redirect_to @farm, notice: 'Farm was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @farm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /farms/1
  # DELETE /farms/1.json
  def destroy
    @farm = Farm.find(params[:id])
    @farm.destroy

    respond_to do |format|
      format.html { redirect_to farms_url }
      format.json { head :no_content }
    end
  end
end
