class StaticPagesController < ApplicationController
  # before_action :skip_login, only: [:home]
  
  layout 'login'
  
	def home
	  @user = User.new
	end

	def about

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
