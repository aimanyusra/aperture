class TagsController < ApplicationController
	def index
    @tags = Tag.all
  end

  def search
    options = {
      fields: %w(name),
      misspellings: { below: 5 },
      page: params[:page], 
      per_page: 10
    }

    @tags = Tag.search(params[:text], options)
    if @tags.blank?
      redirect_to tags_path, flash:{danger: "No photos contain those tags. Try again?"}
    else
      render :index
    end
  end
end
