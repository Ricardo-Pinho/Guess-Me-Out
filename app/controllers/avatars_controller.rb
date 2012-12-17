class AvatarsController < ApplicationController

  before_filter :authenticate_user

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

    respond_to do |format|
      if @avatar.save
        format.html { redirect_to @avatar, notice: 'Avatar was successfully created.' }
        format.json { render json: @avatar, status: :created, location: @avatar }
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
	#ainda em teste
		respond_to do |format|
			@avatarC = Avatar.new()
			@avatarC.name = params[:name]
			@cTypeHair = Avatarcomponent.new()
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
				
				@cTypeHair.component_id = 1
				@cTypeSkin.component_id = 2
				@cTypeEyes.component_id = 3
				@cTypeNose.component_id = 4
				@cTypeMouth.component_id = 5
				@cTypeFacial.component_id = 6
				@cTypeShirt.component_id = 7
				
				@cTypeHair.componenttype_id = params[:idHair]
				@cTypeSkin.componenttype_id = params[:idSkin]
				@cTypeEyes.componenttype_id = params[:idEyes]
				@cTypeNose.componenttype_id = params[:idNose]
				@cTypeMouth.componenttype_id = params[:idMouth]
				@cTypeFacial.componenttype_id = params[:idFacial]
				@cTypeShirt.componenttype_id = params[:idShirt]
				
				if @cTypeHair.save and @cTypeSkin.save and @cTypeEyes.save and @cTypeNose.save and @cTypeMouth.save and @cTypeFacial.save and @cTypeShirt.save
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
