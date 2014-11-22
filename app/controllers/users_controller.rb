class UsersController < ApplicationController
	before_action :require_login, :except => [:new, :create]
	before_action :require_current_user, :only => [:edit, :update, :destroy]
	
	def new
	end

	def index
		# action saved for search function implementation
	end

	def show
		@user  = User.find(params[:id])
		@posts = @user.posts.chronological
		@post  = current_user.posts.build if signed_in_user?
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			flash[:success] = "Thank you for signing up with Danebook!"
			redirect_to @user
		else
			render 'static_pages/home'
		end
	end

	def edit
	end

	def update
		if current_user.update(user_params)  # <<<<<
      flash[:success] = "Successfully updated your profile"
      redirect_to current_user
    else
      flash.now[:failure] = "Failed to update your profile"
      render :edit
    end
	end

	def destroy
	end

  private

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password, 
  		                           :password_confirmation, :birth_day, :birth_month,
  		                           :birth_year, :gender)
  end

end
