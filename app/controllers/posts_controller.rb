class PostsController < ApplicationController
  before_action :require_login

	def create
    @post = User.find(params[:id]).posts.build(post_params)
    if @post.save
    	flash[:success] = "Posted!"
    	redirect_to current_user
    else
    	render 'static_pages/home'
    end
	end

	def destroy

	end

	private

	def post_params
		params.require(:post).permit(:content)
	end

end
