class CommentsController < ApplicationController
	
	before_action :set_return_path, only: [:create, :destroy]

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(comment_params)
		if @comment.save
			flash[:success] = "Comment posted!"
		else
		  flash[:error] = "Weird, something went wrong."
		end
		redirect_to session.delete(:return_to)
	end
  
  def destroy
  	@comment = Comment.find(params[:id])

  	if @comment.destroy
  		flash[:success] = "Comment deleted."
  	else
  		flash[:error] = "Weird, something went wrong."
  	end
  	redirect_to session.delete(:return_to)
  end

	private

	def comment_params
		params.require(:comment).permit(:content, :user_id)
	end
end
