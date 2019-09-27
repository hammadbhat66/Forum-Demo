class CommentsController < ApplicationController
	def create
		@comment = current_user.comments.build(comment_params)
		@comment.forum_id = params[:forum_id]
		@comment.save!
        @comments = Comment.where(forum_id:params[:forum_id]).order("created_at DESC")
		respond_to do |format|
			format.html
			format.js
		end
		  
	end
	def update
		
	end
	def destroy
		@comment = Comment.find(params[:id])
        @comments = Comment.where(forum_id:params[:forum_id]).order("created_at DESC")
        @forum = Forum.find(params[:forum_id])
		if @comment.destroy!
			respond_to do |format|
				format.html
				format.js
			end
		else
			redirect_back(fallback_location: root_path)
		end
	end
	protected 
	def comment_params
		params.require(:comment).permit(:comment)
	end
end
