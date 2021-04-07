class CommentsController < ApplicationController
  include SessionHelper

  def new
    @photo = Photo.find(params[:id])

    @comment = Comment.new
    @comment.photo = @photo
    @comment.user = current_user
    @comment.date_time = Time.now
  end

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.photo }
        format.json { render :show, status: :created, location: @comment.photo }
      else
        puts @comment.errors.full_messages
        format.html { render :new, status: :unprocessable_entity }
        format.json {
          render json: @comment.errors, status:
            :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:photo, :user, :date_time, :comment)
  end
end
