class CommentsController < ApplicationController

	def new

	end

	def create
		@post = Post.find(params[:post_id])
	  	@comment = @post.comments.create(comment_params)
	 	@comment.user_id = current_user.id #or whatever is you session name
	  
	  	if @comment.save
	    	redirect_to home_path
	  	else
	    	flash.now[:danger] = "error"
  		end
	end

	def edit

	end

	def update

	end

	def destroy

	end

end