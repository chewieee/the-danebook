class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(comment_params)
		if @comment.save
			flash[:success] = "Comment posted!"
			redirect_to root_path
		else
			redirect_to root_path
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:content, :user_id)
	end
end
