class FriendshipsController < ApplicationController
	
  def create
    @user = User.find(params[:friendship][:friended_id])
	  current_user.friend!(@user)
	  redirect_to @user
	end

	def destroy
		@user = Friendship.find(params[:id]).friended
		current_user.unfriend!(@user)
		redirect_to @user
	end
end
