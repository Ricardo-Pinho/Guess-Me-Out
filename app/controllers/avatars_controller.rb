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
    @avatarcomponents = Avatarcomponent.all( :conditions=> ["avatar_id like ?", + @avatar.id])
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
  @avatar.svg="<g id=\"Body\"><path id=\"path5\" fill=\"#FFD3B3\" d=\"M80.434,513.702h401.96c0,0,1.483-44.497-28.182-80.837c-29.665-36.339-58.04-50.063-80.837-62.296c-15.203-8.158-20.707-9.093-29.851-14.833c-9.725-6.104-8.712-32.308-10.383-45.053c-0.68-15.621-1.359-25.469-2.039-38.194l-114.581,26.884c0.947,10.058,2.535,21.444,2.596,29.665c-0.862,7.763-1.485,31.057-12.607,35.598c-11.004,4.493-40.444,16.058-56.734,22.249c-19.165,7.876-38.156,18.457-49.317,33.373c-11.35,15.167-15.957,28.963-17.799,44.126C80.456,482.519,80.434,513.702,80.434,513.702L80.434,513.702z\"/><path id=\"Face-8\" fill=\"#FFD3B3\" d=\"M203.334,323.991c0,0,76.873,22.928,136.888-33.042c60.016-55.969,51.356-132.379,47.878-159.814c-4.117-32.467-31.02-76.873-88.337-80.245c-57.318-3.372-98.452,2.697-122.728,32.367c-24.275,29.671-7.305,52.202-17.532,89.012c-4.861,17.494-19.556,50.574-18.207,74.85C142.644,271.395,151.41,307.808,203.334,323.991L203.334,323.991z\"/></g><g id=\"Right_Eye_White\"><path id=\"path3786-5\" fill=\"#FFFFFF\" d=\"M250.357,225.482c10.586,1.895,20.422-5.816,24.774-14.984 c7.773-13.894,13.138-30.986,7.438-46.608c-2.434-6.667-7.192-13.764-14.845-14.629c-8.021-1.44-14.824,4.341-19.892,9.803 c-9.818,10.753-12.754,25.879-12.921,40.007c0.247,9.753,3.982,20.644,12.938,25.628 C248.647,225.065,249.49,225.338,250.357,225.482z\"/></g> <g id=\"Left_Eye_White\"><path id=\"path3809-4\" fill=\"#FFFFFF\" d=\"M172.904,210.851c0,0,6.54,1.55,12.393-7.745c5.852-9.294,10.154-21.687,9.639-40.275 c-0.517-18.589-9.467-23.58-15.663-21.343s-13.425,13.598-16.352,25.646c-2.926,12.049-2.065,24.957-1.032,30.121 C162.921,202.417,167.224,209.474,172.904,210.851L172.904,210.851z\"/> </g> <g id=\"Eye_Color\"><path id=\"path3815-2\" fill=\"#000000\" d=\"M176.863,199.835c5.729,0.944,11.476-10.047,12.22-19.965c1.428-19.012-2.069-27.957-7.057-28.228 c-5.682-0.309-10.499,11.359-11.704,22.203S169.29,198.975,176.863,199.835z\"/><path id=\"path3817-1\"  fill=\"#000000\" d=\"M249.841,212.573c7.918,1.377,12.909-9.639,14.975-22.72s-1.894-25.99-7.573-27.367 s-12.909,12.221-14.286,23.236S241.924,211.024,249.841,212.573L249.841,212.573z\"/></g> <g id=\"Nose\"><path id=\"path3891-9\" fill=\"#FFD3B3\" d=\"M209.737,187.787c0,0-3.931,13.925-6.063,20.6c-1.037,3.246-14.592,20.881-13.559,23.807 c1.032,2.927,22.72,4.819,22.72,4.819s3.786-21.515,3.098-28.571S209.737,187.787,209.737,187.787z\"/></g> <g id=\"Ear\"><path id=\"path3893-9\" fill=\"#FFD3B3\" d=\"M320.906,178.9c0,0,11.681,5.191,9.826,17.243c-1.854,12.051-2.225,8.528-3.894,13.163 c-1.668,4.636,0.742,6.118-2.781,10.383c-3.522,4.265-9.27,7.046-9.27,7.046s9.826,10.012,15.944,1.298s2.225-6.86,5.006-11.866 s5.748-0.186,9.085-13.72c3.338-13.535,3.522-15.574-2.41-25.216C336.48,167.59,320.906,178.9,320.906,178.9L320.906,178.9z\"/></g><g id=\"Mouth\"><path id=\"Mouth-0\" fill=\"#FFFFFF\" fill-opacity=\"0.9647\" d=\"M265.841,260.849c0,0-61.926,13.35-73.421,12.236 c-11.495-1.112-35.969-22.248-35.969-22.248s17.799,28.923,33.744,31.519C206.139,284.951,265.841,260.849,265.841,260.849z\"/></g><g id=\"Hair\"><path id=\"path21\" fill=\"#E6B45E\" d=\"M163.119,32.668c-17.314,12.758-25.625,27.953-40.097,72.902 c-6.365,19.772-3.645,28.249-5.468,47.386c-1.63,17.117,8.202,59.233,8.202,59.233l11.847-15.491l7.29,18.226l15.491-43.742 l-2.733,41.008c13.053-29.166,13.95-65.626,39.185-87.482c10.297,27.394,8.693,56.771,4.557,86.571 c12.418-24.067,23.987-29.196,20.959-78.37c0.821,25.212,2.57,50.424,4.557,75.636c9.545-28.271,9.275-57.77,36.451-83.837 c12.035,14.201,13.144,37.77,8.201,66.523c13.728-13.932,24.954-29.649,21.871-55.588c10.242,0,3.037,85.709,2.733,89.305 c-0.681,8.081,24.397-98.495,10.024-103.886c8.087,13.366,18.131,23.602,14.58,55.588c10.434-2.839,19.234-4.046,20.049,2.734 c7.37,13.669,4.766,27.338,5.468,41.007l12.758-46.475l-14.581,86.571l23.693-51.942l-9.112,77.458l20.048-41.008l5.468,58.322 c0,0,24.604-77.459,20.048-136.691c-4.557-59.233-26.476-105.367-38.273-119.378c-29.161-34.628-59.284-14.401-53.766-17.313 c3.454-1.823-6.716-13.67-24.604-16.403c-17.518-1.907-31.128-5.78-65.612-0.911C194.179,16.598,189.716,16.448,163.119,32.668 L163.119,32.668z\"/></g> <g id=\"Moustache\"><path id=\"path21\" fill=\"#E6B45E\" /></g> <g id=\"Tshirt\"><path id=\"path25\" fill=\"#C42C2C\" d=\"M76.5,487.5c0,0-5-28,13.5-59s63.391-50.771,87.03-58.061 c23.47-7.238,36.53-13.172,36.53-13.172s-3.277,9.646-6.939,27.556C202.589,404.546,215.5,417,232.5,417.5s48.744-6.983,73.854-22.5 c24.494-15.138,37.432-42.771,37.237-43.207c0,0,11.208,10.894,24.247,16.01c23.03,9.036,45.359,18.337,62.161,31.697 c16.9,13.438,45.613,58.53,49.401,76.917c0.195,0.947-53.109,22.958-81.401,37.083L113,513L76.5,487.5z\"/></g>"
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
      flash.now[:notice] = "Avatar created Successfully"
      flash.now[:color]= "valid"
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
    @avatar.destroy

    respond_to do |format|
      format.html { redirect_to avatars_url }
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
