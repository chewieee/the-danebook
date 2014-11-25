class LikesController < ApplicationController
	before_action :set_return_path, only: [:create, :destroy]
  
  def new
  end
  
  def create
    klass, likable_id = parse_klass_and_id

    @likable = klass.find(params[likable_id])
    @like = @likable.likes.build(:user_id => current_user.id)
    
    if @like.save
    	flash[:succcess] = "Liked."
    else
    	flash[:error] = "Didn't like for some reason."
    end

    redirect_to session.delete(:return_to)
  end

  def destroy
    @like = Like.find(params[:id])

    if @like.destroy
    	flash[:success] = "Unliked"
    else
    	flash[:error] = "Ooops, couldnt' unlike."
    end
    
    redirect_to session.delete(:return_to)
  end


  private

	def parse_klass_and_id
    klass = params[:likable].constantize
    likable_id = "#{klass}_id".downcase.to_sym
    return klass, likable_id
  end
end

