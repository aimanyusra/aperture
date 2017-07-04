class TagsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def search
        @listings = Listing.search(params[:text], fields: ["name", "location"], mispellings: {below: 5})
        if @listings.blank?
          redirect_to listings_path, flash:{danger: "no successful search result"}
        else
          render :index
        end
  end
end