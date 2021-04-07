class CommentsController < ApplicationController
  include SessionHelper
  def new
    @photo = Photo.find(params[:id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.photo_id = params[:id]
    @comment.user_id = current_user_id
    @comment.date_time = Time.now

    @photo = Photo.find(params[:id])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_path(Photo.find(params[:id])[:user_id]) }
        format.json { render :show, status: :created, location: @comment.photo }
      else
        puts @comment.errors.full_messages
        format.html { render :new, status: :unprocessable_entity }
        format.json {
          render json: @comment.errors,
                 status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
