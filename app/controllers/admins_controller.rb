class AdminsController < ApplicationController
	def index 
		@user = User.all
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
	end
	
end