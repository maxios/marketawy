class UsersController < ApplicationController


	def show
		@user = User.find(params[:id])
	end

	def edit

	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
	end
end