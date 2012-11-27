
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
				if @user.save
					format.json{
						render :json => @user.to_json(:only=>[:name,:email,:birthdate])
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
    @flash_notice=""
    flash[:color]= "valid"

    if (@user_edit.email!=@user.email)
      @user.email=@user_edit.email
      @flash_notice <<"Email edited. "
    end

    if (@user_edit.name!=@user.name)
        @user.name=@user_edit.name
        @flash_notice << "Name edited. "
    end

    if (@user_edit.password!="")
      if (@user_edit.password==@user_edit.password_confirmation)
        @user.password=@user_edit.password
        @user.encrypted_password=@user_edit.password
        @flash_notice << "Password edited. "
      else
        flash[:color]= "invalid"
        @flash_notice << "Password Confirmation does not match the initial Password. "
      end
    end

    if (@user_edit.birthdate!=@user.birthdate)
      @user.birthdate=@user_edit.birthdate
      @flash_notice << "Birthdate edited. "
    end

    if (@user_edit.sex!=@user.sex)
      @user.sex=@user_edit.sex
      @flash_notice << "Sex edited. "
    end

    if (@user_edit.location!=@user.location)
      @user.location=@user_edit.location
      @flash_notice << "Location edited. "
    end

    if (@user_edit.admin!=@user.admin)
    @user.admin=@user_edit.admin
    @flash_notice << "Status edited. "
    end

    if (@user_edit.credits!=@user.credits)
      @user.credits=@user_edit.credits
      @flash_notice << "Status edited. "
    end

	if @user.save
		flash[:notice] = @flash_notice
		if (session[:saved_location] == "profile")
		session[:saved_location] = ""
		redirect_to(:controller=>'sessions', :action => 'profile')
		else
			redirect_to(:controller=>'users', :action => 'show', :id =>@user.id)
		end
		else
			flash[:notice] = "Form is invalid"
			flash[:color]= "invalid"
			if (session[:saved_location] == "profile")
			session[:saved_location] = ""
			redirect_to(:controller=>'sessions', :action => 'profile')
			else
			redirect_to(:controller=>'users', :action => 'show', :id =>@user.id)
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
end
