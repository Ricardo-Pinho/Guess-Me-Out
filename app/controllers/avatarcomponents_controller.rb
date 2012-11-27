class AvatarcomponentsController < ApplicationController
  # GET /avatarcomponents
  # GET /avatarcomponents.json
  def index
    @avatarcomponents = Avatarcomponent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @avatarcomponents }
    end
  end

  # GET /avatarcomponents/1
  # GET /avatarcomponents/1.json
  def show
    @avatarcomponent = Avatarcomponent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @avatarcomponent }
    end
  end

  # GET /avatarcomponents/new
  # GET /avatarcomponents/new.json
  def new
    @avatarcomponent = Avatarcomponent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @avatarcomponent }
    end
  end

  # GET /avatarcomponents/1/edit
  def edit
    @avatarcomponent = Avatarcomponent.find(params[:id])
  end

  # POST /avatarcomponents
  # POST /avatarcomponents.json
  def create
    @avatarcomponent = Avatarcomponent.new(params[:avatarcomponent])

    respond_to do |format|
      if @avatarcomponent.save
        format.html { redirect_to @avatarcomponent, notice: 'Avatarcomponent was successfully created.' }
        format.json { render json: @avatarcomponent, status: :created, location: @avatarcomponent }
      else
        format.html { render action: "new" }
        format.json { render json: @avatarcomponent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /avatarcomponents/1
  # PUT /avatarcomponents/1.json
  def update
    @avatarcomponent = Avatarcomponent.find(params[:id])

    respond_to do |format|
      if @avatarcomponent.update_attributes(params[:avatarcomponent])
        format.html { redirect_to @avatarcomponent, notice: 'Avatarcomponent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @avatarcomponent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avatarcomponents/1
  # DELETE /avatarcomponents/1.json
  def destroy
    @avatarcomponent = Avatarcomponent.find(params[:id])
    @avatarcomponent.destroy

    respond_to do |format|
      format.html { redirect_to avatarcomponents_url }
      format.json { head :no_content }
    end
  end
end
