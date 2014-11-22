class PostsController < ApplicationController
  before_action :require_login
 

	def create
      @post = User.find(params[:user_id]).posts.build(post_params)
      if @post.save
    	flash[:success] = "Posted!"
    	redirect_to @post.user
      else
        @feed_items = []
        render 'static_pages/home'
      end
	end

	def destroy
      @post = current_user.posts.find_by(id: params[:id])
      if @post.destroy
        flash[:success] = "Post deleted."
        redirect_to @post.user
      else
    	redirect_to @post.user
      end
	end

	private

	def post_params
		params.require(:post).permit(:content)
	end


end
