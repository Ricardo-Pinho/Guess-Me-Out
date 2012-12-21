
   class UsersController < ApplicationController

  before_filter :save_login_state, :only => [:new, :create, :notshow_android, :create_android]
  before_filter :authenticate_user, :except => [:new, :create, :show, :notshow_android, :create_android, :new_android]


  def new
      #Signup Form
      @user = User.new     
  end

  def new_android
      @user = User.new  
  end

  def search
    @query = User.new(params[:search_query])
    @users = User.all( :conditions=> ["username like ?","%" + @query.username  + "%"])
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
					if @user.save!
						format.json{
							render :json => @user.to_json(:only=>[:name,:email,:birthdate,:id])
						}
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
        flash.now[:notice] = "Form is invalid"
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
		if @user.save
			flash[:notice] = "You Signed up successfully"
			flash[:color]= "valid"
			redirect_to(:controller=>'sessions', :action => 'login')
		else
			flash.now[:notice] = "Form is invalid"
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
