class HomeController < ApplicationController

	def home
		#Home Page
  end

  def help
    #Help Page
  end

  def statistics
    #Statistics Page
  end

  def search
     @name = params[:name]
     @searchtype = params[:searchtype]
     if @searchtype=='Users'
        redirect_to(:controller=>'users', :action => 'search', :name =>@name)
       return
     end
     if @searchtype=='Avatars'
        redirect_to(:controller=>'avatars', :action => 'search', :name =>@name)
       return
     end
     if @searchtype=='Components'
         redirect_to(:controller=>'components', :action => 'search', :name =>@name)
       return
     end
     if @searchtype=='Items'
         redirect_to(:controller=>'componenttypes', :action => 'search', :name =>@name)
       return
     end
        redirect_to(:action => 'search_all', :name =>@name)
      return
  end

  def search_all
    @name = params[:name]
    @users = User.all( :conditions=> ["username like ?","%" + params[:name]  + "%"])
    @avatars = Avatar.all( :conditions=> ["name like ?","%" + params[:name]  + "%"])
    @components = Component.all( :conditions=> ["name like ?","%" + params[:name]  + "%"])
    @componenttypes = Componenttype.all( :conditions=> ["name like ?","%" + params[:name]  + "%"])
    if session[:user_id]
      @usercomponents = Usercomponent.all( :conditions=> ["user_id = ?", + session[:user_id]])
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

end
