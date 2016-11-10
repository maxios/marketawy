class CommentsController < ApplicationController

	def new

	end

	def create
		@commentable = Post.find(params[:post_id])
	  	@comment = @commentable.comments.create(comment_params)
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

def coment_params
	params.require(:comments).permit(:post_id, :user_id, :comment, :title)
end
	

end