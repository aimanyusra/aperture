class TagsController < ApplicationController
	def index
    @tags = Tag.all
    @user = current_user
    @photos = Photo.order('created_at DESC')
    # @photos = Photo.paginate(page: params[:page], per_page: 10).order('created_at DESC')
    respond_to do |format|
      format.html
      format.js
    end
  end

  def search
    options = {
      fields: %w(name),
      misspellings: { below: 5 }
      # page: params[:page], 
      # per_page: 10
    }

    @tags = Tag.search(params[:text], options)
    if @tags.blank?
      redirect_to tags_path, flash:{notice: "Try to search for tags! Ex. \"City\",\"Beach\" "}
    else
      render :index
    end
  end
end
