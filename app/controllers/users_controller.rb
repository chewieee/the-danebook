class UsersController < ApplicationController
	before_action :require_login, :except => [:new, :create]
	before_action :require_current_user, :only => [:edit, :update, :destroy]
	
	def new
	end

	def index
		@user  = current_user
		@users = User.search(params[:query])
	end

	def show
		@user    = User.find(params[:id])
		@posts   = @user.posts.chronological
		@post    = current_user.posts.build if signed_in_user?
		@friends = @user.friended_users.limit(6)
		@photos  = @user.photos
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
		@user = User.find(params[:id])
	end

	def update
		@user = current_user

		if params[:profile_photo_id]
      @user.profile_photo = @user.photos.find(params[:profile_photo_id])
    elsif params[:cover_photo_id]
      @user.cover_photo = @user.photos.find(params[:cover_photo_id])
    end

		if @user.update_attributes(user_params)  # <<<<<
      flash[:success] = "Successfully updated your profile"
      redirect_to user_about_path(@user)
    else
      flash.now[:failure] = "Failed to update your profile"
      render :edit
    end
	end

	def destroy
	end

	def friended_users
		@user    = User.find(params[:id])
		@friends = @user.friended_users
	end

  private

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password, 
  		                           :password_confirmation, :birth_day, :birth_month,
  		                           :birth_year, :gender, :words, :about_me, :phone,
  		                           :profile_photo_id, :cover_photo_id)
  end

end
