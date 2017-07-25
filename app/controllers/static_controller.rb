class StaticController < ApplicationController
	before_action :logged_in_user, only: [:submit]

	def home
		@user = current_user
		# @photos = Photo.order('created_at DESC')
		@photos = Photo.paginate(page: params[:page], per_page: 10).order('created_at DESC')
		gon.photo = nsvdhf
		respond_to do |format|
			format.html
			format.js
		end
		render 'static/home'
	end

	def submit
		@photo = Photo.new(photo_params)
		@user = User.find(params[:id])
		render 'static/submit'		
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

  def photo_params
    params.require(:photo).permit(:image)
  end
end
