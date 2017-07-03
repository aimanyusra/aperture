class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  before_action :set_photo, only: :edit

 

 	def index
 		@users = User.paginate(page: params[:page], per_page: 10).order('created_at ASC')
 	end

	def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      params[:photos]['image'].each do |a|
        @photo = @user.photos.create!(:image => a, :user_id => @user.id)
      end
      log_in @user    	
    	flash[:success] = "Welcome to the Aperture!"
      redirect_to @user    
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

    @user = User.find(params[:id])
    store_photos
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

	def user_params
	  params.require(:user).permit(:name, :email, :password, :password_confirmation, photo_attributes: [:id, :user_id, :image])                            
	end

	# Confirms user is logged in
  def logged_in_user
    unless logged_in?
    	store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms correct user has access
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def store_photos
    photo = params[:user][:image]
    photo.each{|photo| @user.photo.create(image: photo)} if photo
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end
end
