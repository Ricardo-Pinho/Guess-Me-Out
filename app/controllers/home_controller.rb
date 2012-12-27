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

end
