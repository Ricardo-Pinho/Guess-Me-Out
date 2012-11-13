
   class UsersController < ApplicationController

  before_filter :save_login_state, :only => [:new, :create, :show, :notshow_android, :create_android]

  def new
      #Signup Form
      @user = User.new     
  end
  
  def show
	  @user = User.find( params[:id] )
	  respond_to do |format|
		format.html
		format.json
	  end
  end
  
  def notshow_android
	  respond_to do |format|
		format.json{
		render :json => "{not registered}"
    }
	  end
  end

   def create_android
    	@user = User.new(params[:user])
    	if @user.save
			redirect_to(:controller=>'users', :action => 'show', :id=>@user.id, :format=>'json')
      else
		redirect_to(:controller=>'users', :action => 'notshow_android', :format=>'json')
      end
    end

  def edit
    @user=User.find( :params[user_id])
    if (params[:user].email!="")
      @user.email=params[:user].email
      flash.now[:notice]  ="Email edited. "
    end
    if (params[:user].password!="")
      if (params[:user].password_confirmation==params[:user].password)
        @user.password= params[:user].password
        flash.now[:notice]  ="Password edited. "
      end
    end
    if (params[:user].location!="")
      @user.location=params[:user].location
      flash.now[:notice]  ="Location edited. "
    end
    if @user.save
          flash.now[:notice] += ""
        flash.now[:color]= "valid"
        redirect_to(:controller=>'sessions', :action => 'login')
    else
          flash.now[:notice] = "Form is invalid"
          flash.now[:color]= "invalid"
          render "new"
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
