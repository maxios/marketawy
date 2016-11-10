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
    @user = @post.user_id
    @comment = Comment.new  
  end

   def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
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

  def add_comment
   
    post_id = params[:post_id]
    # Get the object that you want to comment

    post = Comment.find_by post_id: post_id

    # Create a comment with the user submitted content
    comment = Comment.new(params[:comment])
    # Assign this comment to the logged in user
    comment.user_id = session[:user].id

    # Add the comment
    post.comments << comment

    redirect_to home_path
  end
end

