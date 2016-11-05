class PagesController < ApplicationController

before_action :authenticate_user!, except: [:index]

  def index
  	@resource = User.new
    if user_signed_in?
      redirect_to home_path
    end
  end

  def home
    @post = Post.new
  end
   

  def profile
   # @profile_user = Profile.new(params[:user_id])
   @post = Post.new
   @user = User.find(params[:id])
    
  end

  def addjob
  end

  def settings
  end
 
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
	end

	def trial_signup_submit
  @user = User.create(params[:user])
  end

def post_params
      params.require(:post).permit(:content, :user, :marketawy)
    end
  
end