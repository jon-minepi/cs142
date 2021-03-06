class PhotosController < ApplicationController
  include SessionHelper
  def new
    @photo = Photo.new
  end

  def create
    if !logged_in?
      redirect_to photos_new_path, notice: "No user logged in, please log in"
      return
    end

    uploaded_io = params[:photo][:image]
    File.open(Rails.root.join('app', 'assets', 'images', uploaded_io.original_filename), 'w') do |file|
      file.write(uploaded_io.read.force_encoding(Encoding::UTF_8))
    end

    @photo = Photo.new
    @photo.file_name = uploaded_io.original_filename
    @photo.date_time = Time.now
    @photo.user_id = current_user_id
    if @photo.save
      redirect_to user_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:image)
  end
end
