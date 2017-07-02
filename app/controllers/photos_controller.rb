class PhotosController < ApplicationController
	before_action :logged_in_user, only: [:new, :create]
	before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def index
  	@photos = Photo.all
  end

  def new
  	@photo = Photo.new
  end

  def create
  	@photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully submitted.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path, notice:  "The photo has been deleted."
  end
end

private
	
	# Confirms user is logged in
  def logged_in_user
    unless logged_in?
    	store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:user_id, :image)
  end