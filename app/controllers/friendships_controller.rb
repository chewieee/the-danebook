class FriendshipsController < ApplicationController
	
	before_action :set_return_path, only: [:create, :destroy]

  def create
    @user = User.find(params[:friendship][:friended_id])
	  current_user.friend!(@user)
	  redirect_to session.delete(:return_to)
	end

	def destroy
		@user = Friendship.find(params[:id]).friended
		current_user.unfriend!(@user)
		redirect_to session.delete(:return_to)
	end
end
