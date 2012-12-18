class NodeController < ApplicationController

	respond_to :json
	def find_match
		@user = User.find_by_email( params[:id] )
		render :json => "{\"playerID\": \"#{@user.email}\",\"status\": \"true\"}"
	end

end
