class UsersController < ApplicationController
	
	def new
	end

	def index
		# action saved for search function implementation
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in @user
			flash[:success] = "Thank you for signing up with Danebook!"
			redirect_to :show
		else
			render 'static_pages/home'
		end
	end

	def edit
	end

	def update
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
