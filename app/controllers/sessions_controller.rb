class SessionsController < ApplicationController
 
	before_filter :authenticate_user, :except => [:index, :login, :login_attempt, :login_android, :notlogin_android, :login_attempt_android, :logout]
	before_filter :save_login_state, :only => [:index, :login, :login_attempt, :login_android, :notlogin_android, :login_attempt_android]

	def profile
		#Profile Page
	end

	def login
		#Login Form
	end
	
	def login_android
		#Login Form
	end
	
	def notlogin_android
	  respond_to do |format|
		format.json{
		render :json => "{Invalid Username or Password}"
    }
	  end
    end

	def login_attempt
		authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
		if authorized_user
			session[:user_id] = authorized_user.id
			flash[:notice] = "Welcome again, you logged in as #{authorized_user.username}"
			redirect_to(:controller=>'home', :action => 'home')


		else
			flash.now[:notice] = "Invalid Username or Password"
        	flash.now[:color]= "invalid"
			render "login"	
		end
	end
	
	def login_attempt_android
		authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
		if authorized_user
			redirect_to(:controller=>'users', :action => 'show', :id=>authorized_user.id, :format=>'json')
			
		else
			redirect_to(:controller=>'sessions', :action => 'notlogin_android', :format=>'json')
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to :action => 'login'
	end

end
