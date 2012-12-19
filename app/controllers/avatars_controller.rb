class AvatarsController < ApplicationController

  #before_filter :authenticate_user

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
    @avatar = Avatar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @avatar }
    end
  end

  # GET /avatars/1/edit
  def edit
    @avatar = Avatar.find(params[:id])
  end
	
  # POST /avatars
  # POST /avatars.json
  def create
    @avatar = Avatar.new(params[:avatar])
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
				
			format.html { redirect_to @avatar, notice: 'Avatar was successfully created.' }
			format.json { render json: @avatar, status: :created, location: @avatar }
		  else
			format.html { render action: "new" }
			format.json { render json: @avatar.errors, status: :unprocessable_entity }
		end
      else
        format.html { render action: "new" }
        format.json { render json: @avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /avatars/1
  # PUT /avatars/1.json
  def update
    @avatar = Avatar.find(params[:id])

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
