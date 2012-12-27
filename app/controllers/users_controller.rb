
   class UsersController < ApplicationController

  before_filter :save_login_state, :only => [:new, :create, :notshow_android, :create_android]
  before_filter :authenticate_user, :except => [:new, :create, :search, :show, :notshow_android, :create_android, :new_android]


  def new
      #Signup Form
      @user = User.new     
  end

  def new_android
      @user = User.new  
  end

  def search
    @users = User.all( :conditions=> ["username like ?","%" + params[:name]  + "%"])
    respond_to do |format|
    format.html
    format.json
    end
  end
  
  def show
	@user = User.find( params[:id] )
  @user_avatar = Avatar.find_by_user_id( @user.id )
	session[:saved_location] = ""
	respond_to do |format|
		format.html
		format.json
	end
  end
  
  def notshow_android
	  respond_to do |format|
		format.json{
		render :json => "{\"user\": \"not-registered\"}"
    }
	  end
  end

	def create_android
		respond_to do |format|
			@user = User.new()
			@user.name = params[:name]
			@user.email = params[:email]
			@user.password = params[:password]
			@user.birthdate = params[:birthdate]
			@user.sex = params[:sex]
			@user.credits = 0
			@user.admin = 0
				
				@existance = User.where("email = ?", @user.email);
				if @existance.empty?
					@user.update_attribute(:authentication,SecureRandom.hex)
					if @user.save!
            @cTypeHair = Usercomponent.new()
            @cHairColor = Usercomponent.new()
            @cShirtColor = Usercomponent.new()
            @cTypeSkin = Usercomponent.new()
            @cTypeEyes = Usercomponent.new()
            @cTypeNose = Usercomponent.new()
            @cTypeMouth = Usercomponent.new()
            @cTypeFacial = Usercomponent.new()
            @cTypeShirt = Usercomponent.new()
            @cTypeHair1 = Usercomponent.new()
            @cHairColor1 = Usercomponent.new()
            @cShirtColor1 = Usercomponent.new()
            @cTypeSkin1 = Usercomponent.new()
            @cTypeEyes2 = Usercomponent.new()
            @cTypeEyes3 = Usercomponent.new()
            @cTypeEyes4 = Usercomponent.new()
            @cTypeEyes1 = Usercomponent.new()
            @cTypeNose1 = Usercomponent.new()
            @cTypeMouth1 = Usercomponent.new()
            @cTypeFacial1 = Usercomponent.new()
            @cTypeShirt1 = Usercomponent.new()

            @cTypeHair.user_id = @user.id
            @cTypeSkin.user_id = @user.id
            @cTypeEyes.user_id = @user.id
            @cTypeNose.user_id = @user.id
            @cTypeMouth.user_id = @user.id
            @cTypeFacial.user_id = @user.id
            @cTypeShirt.user_id = @user.id
            @cHairColor.user_id = @user.id
            @cShirtColor.user_id = @user.id
            @cTypeHair1.user_id = @user.id
            @cTypeSkin1.user_id = @user.id
            @cTypeEyes2.user_id = @user.id
            @cTypeEyes3.user_id = @user.id
            @cTypeEyes4.user_id = @user.id
            @cTypeEyes1.user_id = @user.id
            @cTypeFacial1.user_id = @user.id
            @cHairColor1.user_id = @user.id
            @cShirtColor1.user_id = @user.id

            @cTypeHair.component_id = 1
            @cHairColor.component_id = 2
            @cTypeSkin.component_id = 3
            @cTypeEyes.component_id = 4
            @cTypeFacial.component_id = 5
            @cTypeNose.component_id = 6
            @cTypeMouth.component_id = 7
            @cTypeShirt.component_id = 8
            @cShirtColor.component_id = 9
            @cTypeHair1.component_id = 1
            @cTypeSkin1.component_id = 3
            @cTypeEyes2.component_id = 4
            @cTypeEyes3.component_id = 4
            @cTypeEyes4.component_id = 4
            @cTypeEyes1.component_id = 4
            @cTypeFacial1.component_id = 5
            @cHairColor1.component_id = 2
            @cShirtColor1.component_id = 9

            @cTypeHair.componenttype_id = 1
            @cHairColor.componenttype_id = 3
            @cTypeSkin.componenttype_id =5
            @cTypeEyes.componenttype_id = 7
            @cTypeNose.componenttype_id = 14
            @cTypeMouth.componenttype_id = 15
            @cTypeFacial.componenttype_id = 13
            @cTypeShirt.componenttype_id = 16
            @cShirtColor.componenttype_id = 17
            @cTypeHair1.componenttype_id = 2
            @cTypeSkin1.componenttype_id = 6
            @cTypeEyes2.componenttype_id = 9
            @cTypeEyes3.componenttype_id = 10
            @cTypeEyes4.componenttype_id = 11
            @cTypeEyes1.componenttype_id = 8
            @cTypeFacial1.componenttype_id = 12
            @cHairColor1.componenttype_id = 4
            @cShirtColor1.componenttype_id = 18
            if @cTypeHair.save and @cTypeSkin.save and @cTypeEyes.save and @cTypeNose.save and
                @cTypeMouth.save and @cTypeFacial.save and @cTypeShirt.save and @cHairColor.save and @cShirtColor.save and
                @cTypeHair1.save and @cTypeSkin1.save and @cTypeEyes1.save and @cTypeEyes2.save and @cTypeEyes3.save and
                @cTypeEyes4.save and @cTypeFacial1.save and @cHairColor1.save and @cShirtColor1.save
						format.json{
							render :json => @user.to_json(:only=>[:name,:email,:birthdate,:id,:authentication])
						}
            else
              @user.destroy
              format.json{
                render :json => "{\"user\": \"an-error-occurred\"}"
              }
            end
					else
						format.json{
							render :json => "{\"user\": \"an-error-occurred\"}"
						}
					end
				else
					format.json{
						render :json => "{\"user\": \"already-exists\"}"
					}
				end
			end
    end

  def edit
    @user_edit=User.new(params[:user])
    if(session[:saved_location] == "profile")
      @user=User.find_by_username(@current_user.username)
    else
      @user=User.find_by_username(@user_edit.username)
    end

    if (@user_edit.password!="")
      if (@user_edit.password==@user_edit.password_confirmation)
      else
        flash[:color]= "invalid"
        flash[:notice] = "Password Confirmation does not match the initial Password. "
        if (session[:saved_location] == "profile")
          session[:saved_location] = ""
          redirect_to(:controller=>'sessions', :action => 'profile')
          return
        else
          redirect_to(:controller=>'users', :action => 'show', :id =>@user.id)
          return
        end
      end
    end

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = "User Edited Successfully"
        flash[:color]= "valid"
        if (session[:saved_location] == "profile")
          session[:saved_location] = ""
          redirect_to(:controller=>'sessions', :action => 'profile')
          return
        else
          redirect_to(:controller=>'users', :action => 'show', :id =>@user.id)
          return
        end
      else
        flash.now[:notice] = "There were errors in your form"
        flash.now[:color]= "invalid"
        if (session[:saved_location] == "profile")
          session[:saved_location] = ""
          render "sessions/profile"
          return
        else
          render "show"
          return
        end
      end
    end
  end

  

	def create
		@user = User.new(params[:user])
    if @user.username=="admin"
      @user.admin=1
    else
      @user.admin=0
    end
		if @user.save
      @cTypeHair = Usercomponent.new()
      @cHairColor = Usercomponent.new()
      @cShirtColor = Usercomponent.new()
      @cTypeSkin = Usercomponent.new()
      @cTypeEyes = Usercomponent.new()
      @cTypeNose = Usercomponent.new()
      @cTypeMouth = Usercomponent.new()
      @cTypeFacial = Usercomponent.new()
      @cTypeShirt = Usercomponent.new()
      @cTypeHair1 = Usercomponent.new()
      @cHairColor1 = Usercomponent.new()
      @cShirtColor1 = Usercomponent.new()
      @cTypeSkin1 = Usercomponent.new()
      @cTypeEyes2 = Usercomponent.new()
      @cTypeEyes3 = Usercomponent.new()
      @cTypeEyes4 = Usercomponent.new()
      @cTypeEyes1 = Usercomponent.new()
      @cTypeNose1 = Usercomponent.new()
      @cTypeMouth1 = Usercomponent.new()
      @cTypeFacial1 = Usercomponent.new()
      @cTypeShirt1 = Usercomponent.new()

      @cTypeHair.user_id = @user.id
      @cTypeSkin.user_id = @user.id
      @cTypeEyes.user_id = @user.id
      @cTypeNose.user_id = @user.id
      @cTypeMouth.user_id = @user.id
      @cTypeFacial.user_id = @user.id
      @cTypeShirt.user_id = @user.id
      @cHairColor.user_id = @user.id
      @cShirtColor.user_id = @user.id
      @cTypeHair1.user_id = @user.id
      @cTypeSkin1.user_id = @user.id
      @cTypeEyes2.user_id = @user.id
      @cTypeEyes3.user_id = @user.id
      @cTypeEyes4.user_id = @user.id
      @cTypeEyes1.user_id = @user.id
      @cTypeFacial1.user_id = @user.id
      @cHairColor1.user_id = @user.id
      @cShirtColor1.user_id = @user.id

      @cTypeHair.component_id = 1
      @cHairColor.component_id = 2
      @cTypeSkin.component_id = 3
      @cTypeEyes.component_id = 4
      @cTypeFacial.component_id = 5
      @cTypeNose.component_id = 6
      @cTypeMouth.component_id = 7
      @cTypeShirt.component_id = 8
      @cShirtColor.component_id = 9
      @cTypeHair1.component_id = 1
      @cTypeSkin1.component_id = 3
      @cTypeEyes2.component_id = 4
      @cTypeEyes3.component_id = 4
      @cTypeEyes4.component_id = 4
      @cTypeEyes1.component_id = 4
      @cTypeFacial1.component_id = 5
      @cHairColor1.component_id = 2
      @cShirtColor1.component_id = 9

      @cTypeHair.componenttype_id = 1
      @cHairColor.componenttype_id = 3
      @cTypeSkin.componenttype_id =5
      @cTypeEyes.componenttype_id = 7
      @cTypeNose.componenttype_id = 14
      @cTypeMouth.componenttype_id = 15
      @cTypeFacial.componenttype_id = 13
      @cTypeShirt.componenttype_id = 16
      @cShirtColor.componenttype_id = 17
      @cTypeHair1.componenttype_id = 2
      @cTypeSkin1.componenttype_id = 6
      @cTypeEyes2.componenttype_id = 9
      @cTypeEyes3.componenttype_id = 10
      @cTypeEyes4.componenttype_id = 11
      @cTypeEyes1.componenttype_id = 8
      @cTypeFacial1.componenttype_id = 12
      @cHairColor1.componenttype_id = 4
      @cShirtColor1.componenttype_id = 18



      if @cTypeHair.save and @cTypeSkin.save and @cTypeEyes.save and @cTypeNose.save and
          @cTypeMouth.save and @cTypeFacial.save and @cTypeShirt.save and @cHairColor.save and @cShirtColor.save and
          @cTypeHair1.save and @cTypeSkin1.save and @cTypeEyes1.save and @cTypeEyes2.save and @cTypeEyes3.save and
          @cTypeEyes4.save and @cTypeFacial1.save and @cHairColor1.save and @cShirtColor1.save
			flash[:notice] = "You Signed up successfully"
			flash[:color]= "valid"
			redirect_to(:controller=>'sessions', :action => 'login')
      else
        @user.destroy
        flash.now[:notice] = "Error Creating User. Please Try Again Later"
        flash.now[:color]= "invalid"
        render "new"
      end
		else
			flash.now[:notice] = "Sign up was not successfull"
			flash.now[:color]= "invalid"
			render "new"
		end
  end

  # DELETE /avatars/1
  # DELETE /avatars/1.json
  def destroy
    @user = User.find(params[:id])
    @loggeduser=User.find_by_username(@current_user.username)
    if @user.email!=@loggeduser.email
      Usercomponent.destroy_all(:user_id=> @user.id)
      @avatar=Avatar.find_by_user_id(@user.id)
      if @avatar
        Avatarcomponent.destroy_all(:avatar_id=> @avatar.id)
        @avatar.destroy
      end

      @user.destroy
      flash[:color]= "valid"
      flash[:notice] = "User was deleted"
    respond_to do |format|
      format.html { redirect_to(:controller=>'home', :action => 'home') }
      format.json {render :json => "{user deleted}"}
      end
      else
      flash.now[:color]= "invalid"
      flash.now[:notice] = "User was not deleted"
      respond_to do |format|
        format.html {render "show"}
        format.json {render :json => "{user deleted}"}
        end
      end
  end
	
	def getUserNameById
		respond_to do |format|
			@user = User.find(params[:id])
			format.json{
				render :json => @user.to_json(:only=>[:name])
			}
		end
	end
	
end
