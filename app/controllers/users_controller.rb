  class UsersController < ApplicationController

  before_filter :save_login_state, :only => [:new, :create]

  def new
      #Signup Form
      @user = User.new     
  end

   def create
    	@user = User.new(params[:user])
    	if @user.save
    		flash.now[:notice] = "You Signed up successfully"
			flash.now[:color]= "valid"
			redirect_to(:controller=>'sessions', :action => 'login')
      else
        flash.now[:notice] = "Form is invalid"
        flash.now[:color]= "invalid"
		render "new"
      end
    end

end
