class ComponenttypesController < ApplicationController
  # GET /componenttypes
  # GET /componenttypes.json
  def index
    @componenttypes = Componenttype.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @componenttypes }
    end
  end

  # GET /componenttypes/1
  # GET /componenttypes/1.json
  def show
    @componenttype = Componenttype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @componenttype }
    end
  end

  # GET /componenttypes/new
  # GET /componenttypes/new.json
  def new
    @componenttype = Componenttype.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @componenttype }
    end
  end

  # GET /componenttypes/1/edit
  def edit
    @componenttype = Componenttype.find(params[:id])
  end

  # POST /componenttypes
  # POST /componenttypes.json
  def create
    @componenttype = Componenttype.new(params[:componenttype])
    respond_to do |format|
      if @componenttype.save
        format.html { redirect_to @componenttype, notice: 'Componenttype was successfully created.' }
        format.json { render json: @componenttype, status: :created, location: @componenttype }
      else
        format.html { render action: "new" }
        format.json { render json: @componenttype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /componenttypes/1
  # PUT /componenttypes/1.json
  def update
    @componenttype = Componenttype.find(params[:id])

    respond_to do |format|
      if @componenttype.update_attributes(params[:componenttype])
        format.html { redirect_to @componenttype, notice: 'Componenttype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @componenttype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /componenttypes/1
  # DELETE /componenttypes/1.json
  def destroy
    @componenttype = Componenttype.find(params[:id])
    @componenttype.destroy

    respond_to do |format|
      format.html { redirect_to componenttypes_url }
      format.json { head :no_content }
    end
  end
end
