class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :edit]
  before_action :correct_user, only: [:edit, :update]

  # GET /photos
  # GET /photos.json
  def index
    redirect_to 'static#home'
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @greet = ['A magnificent submission', 'Love this photo? It was uploaded']
    @photo = Photo.find(params[:id])

  end

  # GET /photos/new
  def new
    @photo = Photo.new
    @greeting = ["got something beautiful you'd like to share with the world?", "feeling good today? Spread the happiness one photo at a time!", "show the world some lovin'." ]
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = current_user.photos.new

    # @photo.photo_images = photo_params[:photo_images].map do |img|
    #   byebug
    #   PhotoImage.new(image: img)
    # end
    # @photo = Photo.new(photo_params)
    # @photo.user_id = current_user.id
    respond_to do |format|
      if @photo.save
        # params[:photo]['images'].each do |img|
        @photo_image = PhotoImage.create(image: params[:photo][:photo_images], photo_id: @photo.id)
        # @photo_image = @photo.photo_images.create()
    
        format.html { redirect_to edit_photo_path(@photo), notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    # creates tag objects for photos
    tag_array = tag_params['tags'].split(',').each do |x|
      x.strip!
    end
    tag_array.each do |x|     
      if Tag.find_by(name: x)
        @tag = Tag.find_by(name: x)
      else
        @tag = Tag.create(name: x)
      end
        Tagging.create(photo_id: @photo.id, tag_id: @tag.id)
    end

    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:photo_images, :all_tags)
    end

      # Confirms user is logged in
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def tag_params
      params.require(:photo).permit(:tags)
    end

    # Confirms correct user has access
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
      flash[:warning] = "Whoops! You don't own this photo, so you can't edit it. Enjoy the other ones!"
    end
end
