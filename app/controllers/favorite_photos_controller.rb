class FavoritePhotosController < ApplicationController
  before_action :set_photo
  
  def create
    if Favorite.create(favorited: @project, user: current_user)
      redirect_to @photo, notice: 'Photo has been favorited'
    else
      redirect_to @photo, alert: 'Something went wrong...*sad panda*'
    end
  end
  
  def destroy
    Favorite.where(favorited_id: @photo.id, user_id: current_user.id).first.destroy
    redirect_to @photo, notice: 'Photo is no longer in favorites'
  end
  
  private
  
  def set_project
    @project = Project.find(params[:project_id] || params[:id])
  end
end