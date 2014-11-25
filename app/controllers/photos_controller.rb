class PhotosController < ApplicationController
	
  def new
    @user  = User.find(params[:user_id])
    @photo = @user.photos.build
  end

  def create
    @user = User.find(params[:user_id])

    if params[:photo][:url] != ""
      @photo = @user.photos.build
      @photo.image_from_url(params[:photo][:url])
    else
      @photo = @user.photos.build(photo_params)
    end

    if @photo.save
      flash[:success] = "Photo uploaded."
      redirect_to user_photos_url(@user)
    else
      flash[:error] = "Failed to upload photo."
      render :new
    end
  end
  
  def show
    @user  = User.find(params[:user_id])
    @photo = Photo.find(params[:id])
  end

  def index
	@user = User.find(params[:user_id])
	@photos = @user.photos
  end

  def destroy
    @user = User.find(params[:user_id])
    @photo = @user.photos.find(params[:id])

    if @user.profile_photo_id == @photo.id
      @user.profile_photo_id = nil
      @user.save
    elsif @user.cover_photo_id == @photo.id
      @user.cover_photo_id = nil
      @user.save
    end
    
    if @photo.destroy
      flash[:success] = "Photo deleted."
      redirect_to user_photos_path(@user)
    else
      flash[:error] = "Couldn't delete."
      redirect_to user_photos_path(@user)
    end
  else
    
  end

  private

  def photo_params
	params.require(:photo).permit(:image, :url)
  end

end
