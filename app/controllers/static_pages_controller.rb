class StaticPagesController < ApplicationController
  # before_action :skip_login, only: [:home]
  
  layout 'login', only: [:home]
  
	def home
	  @user = User.new
	  if signed_in_user?
	    @feed_items = current_user.newsfeed
	  end
	end

	def about
    @user = User.find(params[:user_id])
	end

	def about_edit

	end

	def photos

	end

	def timeline

	end

	def friends

	end

	private

	def skip_login
  	redirect_to current_user if signed_in_user?
  end

end
