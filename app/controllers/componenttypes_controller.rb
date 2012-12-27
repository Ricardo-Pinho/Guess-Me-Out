class ComponenttypesController < ApplicationController

  before_filter :authenticate_user, :except => [:index, :gettypebycolor, :show, :getsvgs_android]

  # GET /componenttypes
  # GET /componenttypes.json
  def index
    @componenttypes = Componenttype.all

    respond_to do |format|
      format.html # search.html.erb
      format.json { render json: @componenttypes }
    end
  end

  # GET /componenttypes/1
  # GET /componenttypes/1.json
  def show
    @componenttype = Componenttype.find(params[:id])
    if session[:user_id]
      @usercomponents = Usercomponent.all( :conditions=> ["user_id = ?", + session[:user_id]])
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @componenttype }
    end
  end

  def gettypebycolor
		respond_to do |format|
			@componentid = params[:component_id]
			@color = params[:color]
			@componenttype = Componenttype.all( :conditions=> ["component_id like ? and color like ?", @componentid, @color])
      format.html # show.html.erb
      format.json { render json: @componenttype }
    end
  end
	
	def getsvgs_android
		respond_to do |format|
			@componentid = params[:componentid]
			@componenttype = Componenttype.all( :conditions=> ["component_id like ?", @componentid])
      format.json { render json: @componenttype.to_json(:only=>[:component_id,:color,:svg,:id,:name]) }
    end	
	end

  # GET /componenttypes/new
  # GET /componenttypes/new.json
  def new
    @componenttype = Componenttype.new
    if session[:user_admin]!=1
      flash[:notice] = "Only admins can create Componenttypes!"
      flash[:color]= "invalid"
      redirect_to(:controller => 'home', :action => 'home')
      return
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @componenttype }
    end
  end

  # GET /componenttypes/1/edit
  def edit
    if session[:user_admin]!=1
      flash[:notice] = "Only admins can edit Componenttypes!"
      flash[:color]= "invalid"
      redirect_to(:controller => 'home', :action => 'home')
      return
    end
    @componenttype = Componenttype.find(params[:id])
  end

  # POST /componenttypes
  # POST /componenttypes.json
  def create
    @componenttype = Componenttype.new(params[:componenttype])
    if session[:user_admin]!=1
      flash[:notice] = "Only admins can edit Componenttypes!"
      flash[:color]= "invalid"
      redirect_to(:controller => 'home', :action => 'home')
      return
    end
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
    if session[:user_admin]!=1
      flash[:notice] = "Only admins can update Componenttypes!"
      flash[:color]= "invalid"
      redirect_to(:controller => 'home', :action => 'home')
      return
    end
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
    if session[:user_admin]!=1
      flash[:notice] = "Only admins can destroy Componenttypes!"
      flash[:color]= "invalid"
      redirect_to(:controller => 'home', :action => 'home')
      return
    end
    @componenttype.destroy

    respond_to do |format|
      format.html { redirect_to componenttypes_url }
      format.json { head :no_content }
    end
  end
end
