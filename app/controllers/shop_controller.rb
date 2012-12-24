class ShopController < ApplicationController

  before_filter :authenticate_user, :except => [:index]

  def index
     @componenttypes = Componenttype.all
     if session[:user_id]
      @usercomponents = Usercomponent.all( :conditions=> ["user_id = ?", + session[:user_id]])
     end
  end

  def buy
    @componenttype = Componenttype.find(params[:id])
    @user=User.find(session[:user_id])
    @credits=@user.credits-@componenttype.price
    @usercomponent = Usercomponent.new()
    @usercomponent.user_id=@user.id
    @usercomponent.component_id=@componenttype.component_id
    @usercomponent.componenttype_id=@componenttype.id
    if @credits<0
      flash[:notice] = "You don't have enough Coins for this item!"
      flash[:color]= "invalid"
      redirect_to(:controller=>'shop', :action => 'shop')
      return
    end
    respond_to do |format|
      if @user.update_attribute(:credits,@credits) and @usercomponent.save!
        flash[:notice] = "Item Bought Successfully. Thank you!"
        flash[:color]= "valid"
          redirect_to(:controller=>'shop', :action => 'shop')
          return
      else
        flash.now[:notice] = "Something went Wrong. Please Contact Administration"
        flash.now[:color]= "invalid"
          render "show"
          return
      end
    end

  end

end
