class CommentsController < ApplicationController
	before_action :set_return_path, only: [:create, :destroy]
  
	def create

		klass, commentable_id = parse_klass_and_id

		@commentable  = klass.find(params[commentable_id])
		@comment      = @commentable.comments.build(comment_params)
		# sets the user for the comment to make association
    @comment.user = current_user

		if @comment.save
			flash[:success] = "Comment posted!"
		else
		  flash[:error] = "Weird, something went wrong."
		end
		  
		redirect_to session.delete(:return_to)
	end
  
  def destroy
  	@comment = Comment.find(params[:id])
    @user = @comment.commentable.user

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

  # sorts commentable type i.e. "Photo, Post, etc"
	def parse_klass_and_id
    klass = params[:commentable].constantize
    commentable_id = "#{klass}_id".downcase.to_sym
    return klass, commentable_id
  end
end
