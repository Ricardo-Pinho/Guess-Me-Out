class AvatarsController < ApplicationController

  before_filter :authenticate_user, :except => [:index, :show, :create_avatar_android]

  # GET /avatars
  # GET /avatars.json
  def index
    @avatars = Avatar.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @avatars }
    end
  end

  # GET /avatars/1
  # GET /avatars/1.json
  def show
    @avatar = Avatar.find(params[:id])
    @avatarcomponents = Avatarcomponent.all( :conditions=> ["avatar_id = ?", + @avatar.id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @avatarcomponents}
    end
  end

  # GET /avatars/new
  # GET /avatars/new.json
  def new
    if params[:userid]
      @user= User.find(params[:userid])
      @avatar = Avatar.find_by_user_id(@user.id)
      if @avatar
        if @current_user.admin!=1
          flash[:notice] = "User already has an avatar"
          flash[:color]= "invalid"
          redirect_to(:controller=>'users', :action => 'show', :id => @user.id)
          return
        else
          redirect_to(:controller=>'avatars', :action => 'edit', :id => @avatar.id)
          return
        end
      end
    end
    @avatar = Avatar.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @avatar }
    end
  end

  # GET /avatars/1/edit
  def edit
    @avatar = Avatar.find(params[:id])
    if @avatar.user_id!=@current_user.id && @current_user.admin!=1
      flash.now[:notice] = "Avatar does not belong to you!"
      flash.now[:color]= "invalid"
      render action: "show"
      return
    end
  end
  
  def getavatar
	respond_to do |format|
		@avatar = Avatar.find(params[:id])
		format.json { render json: @avatar }
	end	
  end
	
  # POST /avatars
  # POST /avatars.json
  def create
  @avatar = Avatar.find_by_user_id(@current_user.id)
  if @avatar && @current_user.admin!=1
    flash.now[:notice] = "User already has an avatar"
    flash.now[:color]= "invalid"
    render action: "new"
    return
  end
  @avatar2 = Avatar.new(params[:avatar])
  @avatar = Avatar.find_by_user_id(@avatar2.user_id)
  if @avatar && @current_user.admin!=1
    flash.now[:notice] = "User already has an avatar"
    flash.now[:color]= "invalid"
    render action: "new"
    return
  end
  if @avatar2.user_id!=@current_user.id && @current_user.admin!=1
    flash.now[:notice] = "Can't create an avatar for another user"
    flash.now[:color]= "invalid"
    render action: "new"
    return
  end
  if @avatar && @avatar2.user_id==@current_user.id && @current_user.admin==1
    flash.now[:notice] = "Can't create more than 1 avatar per user"
    flash.now[:color]= "invalid"
    render action: "new"
    return
  end
  @avatar=@avatar2
  @cTypeHair = Avatarcomponent.new()
	@cHairColor = Avatarcomponent.new()
	@cShirtColor = Avatarcomponent.new()
	@cTypeSkin = Avatarcomponent.new()
	@cTypeEyes = Avatarcomponent.new()
	@cTypeNose = Avatarcomponent.new()
	@cTypeMouth = Avatarcomponent.new()
	@cTypeFacial = Avatarcomponent.new()
	@cTypeShirt = Avatarcomponent.new()

	respond_to do |format|
      if @avatar.save
		@cTypeHair.avatar_id = @avatar.id
		@cTypeSkin.avatar_id = @avatar.id
		@cTypeEyes.avatar_id = @avatar.id
		@cTypeNose.avatar_id = @avatar.id
		@cTypeMouth.avatar_id = @avatar.id
		@cTypeFacial.avatar_id = @avatar.id
		@cTypeShirt.avatar_id = @avatar.id
		@cHairColor.avatar_id = @avatar.id
		@cShirtColor.avatar_id = @avatar.id
		
		@cTypeHair.component_id = 1
		@cHairColor.component_id = 2
		@cTypeSkin.component_id = 3
		@cTypeEyes.component_id = 4
		@cTypeFacial.component_id = 5
		@cTypeNose.component_id = 6
		@cTypeMouth.component_id = 7
		@cTypeShirt.component_id = 8
		@cShirtColor.component_id = 9
		
		@cTypeHair.componenttype_id = 1
		@cHairColor.componenttype_id = 3
		@cTypeSkin.componenttype_id =5
		@cTypeEyes.componenttype_id = 7
		@cTypeNose.componenttype_id = 14
		@cTypeMouth.componenttype_id = 15
		@cTypeFacial.componenttype_id = 13
		@cTypeShirt.componenttype_id = 16
		@cShirtColor.componenttype_id = 17
		if @cTypeHair.save and @cTypeSkin.save and @cTypeEyes.save and @cTypeNose.save and @cTypeMouth.save and @cTypeFacial.save and @cTypeShirt.save and @cHairColor.save and @cShirtColor.save
		flash[:notice] = "Avatar created Successfully"
		flash[:color]= "valid"
		if @avatar.user_id==session[:user_id]
			session[:user_avatar]=@avatar.id
		end
			redirect_to @avatar
			return
    else
      flash.now[:notice] = "Error creating the Avatar"
      flash.now[:color]= "invalid"
			render action: "new"
      return
		end
      else
        flash.now[:notice] = "Error creating the Avatar"
        flash.now[:color]= "invalid"
        render action: "new"
        return
      end
    end
  end

  # PUT /avatars/1
  # PUT /avatars/1.json
  def update
    @avatar = Avatar.find(params[:id])
    if @avatar.user_id!=@current_user.id && @current_user.admin!=1
      flash.now[:notice] = "Avatar does not belong to you!"
      flash.now[:color]= "invalid"
      render action: "show"
      return
    end
    respond_to do |format|
      if @avatar.update_attributes(params[:avatar])
        format.html { redirect_to @avatar, notice: 'Avatar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avatars/1
  # DELETE /avatars/1.json
  def destroy
    @avatar = Avatar.find(params[:id])
    if @avatar.user_id!=@current_user.id && @current_user.admin!=1
      flash.now[:notice] = "Avatar does not belong to you!s"
      flash.now[:color]= "invalid"
      render action: "show"
      return
    end
	Avatarcomponent.destroy_all(:avatar_id=> @avatar.id)
    @avatar.destroy
	session[:user_avatar]=-1
    respond_to do |format|
      format.html { redirect_to avatars_url } #need to change this later when search is made
      format.json { head :no_content }
    end
  end
	

	
	def create_avatar_android
		respond_to do |format|
			@avatarC = Avatar.new()
			@avatarC.name = params[:name]
			@avatarC.user_id = params[:userID]
			 
			@cTypeHair = Avatarcomponent.new()
			@cHairColor = Avatarcomponent.new()
			@cShirtColor = Avatarcomponent.new()
			@cTypeSkin = Avatarcomponent.new()
			@cTypeEyes = Avatarcomponent.new()
			@cTypeNose = Avatarcomponent.new()
			@cTypeMouth = Avatarcomponent.new()
			@cTypeFacial = Avatarcomponent.new()
			@cTypeShirt = Avatarcomponent.new()
			@user =User.find_by_authentication(params[:authkey])
      if@user.id!=@avatarC.user_id
        format.json{
          render :json => "{\"avatar\": \"not-done\"}"
        }
        return
      end
			if @avatarC.save
				@cTypeHair.avatar_id = @avatarC.id
				@cTypeSkin.avatar_id = @avatarC.id
				@cTypeEyes.avatar_id = @avatarC.id
				@cTypeNose.avatar_id = @avatarC.id
				@cTypeMouth.avatar_id = @avatarC.id
				@cTypeFacial.avatar_id = @avatarC.id
				@cTypeShirt.avatar_id = @avatarC.id
				@cHairColor.avatar_id = @avatarC.id
				@cShirtColor.avatar_id = @avatarC.id
				
				@cTypeHair.component_id = 1
				@cHairColor.component_id = 2
				@cTypeSkin.component_id = 3
				@cTypeEyes.component_id = 4
				@cTypeFacial.component_id = 5
				@cTypeNose.component_id = 6
				@cTypeMouth.component_id = 7
				@cTypeShirt.component_id = 8
				@cShirtColor.component_id = 9
				
				@cTypeHair.componenttype_id = params[:idHair]
				@cHairColor.componenttype_id = params[:hairColor]
				@cTypeSkin.componenttype_id = params[:idSkin]
				@cTypeEyes.componenttype_id = params[:idEyes]
				@cTypeNose.componenttype_id = params[:idNose]
				@cTypeMouth.componenttype_id = params[:idMouth]
				@cTypeFacial.componenttype_id = params[:idFacial]
				@cTypeShirt.componenttype_id = params[:idShirt]
				@cShirtColor.componenttype_id = params[:shirtColor]
				
				if @cTypeHair.save and @cTypeSkin.save and @cTypeEyes.save and @cTypeNose.save and @cTypeMouth.save and @cTypeFacial.save and @cTypeShirt.save and @cHairColor.save and @cShirtColor.save
					format.json{
						render :json => "{\"avatar\": \"done\"}"
					}
				else
					format.json{
						render :json => "{\"avatar\": \"not-done\"}"
					}
				end
			else
				format.json{
					render :json => "{\"avatar\": \"not-done\"}"
				}						
			end
		end
	end
	
end
