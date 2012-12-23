class ShopController < ApplicationController

  def shop
     @Components = Components.all
     @Componenttypes = Componenttypes.all
     if @current_user
     @UserComponents = UserComponents.all( :conditions=> ["user_id like ?", + @current_user.id])
  end

end
