class VideosController < ApplicationController

  before_action :set_video, only: [ :update, :destroy]

  def index
    if user_signed_in?
      @videos = current_user.videos
      @new_video = Video.new
    else
      redirect_to new_user_session_path, alert: "User must be logged."
    end
  end

  def update
    check_video_owner(@video)
    if @video.update(video_params)
      redirect_to videos_path, notice: 'Video was successfully updated.'
    else
      redirect_to videos_path, notice: 'Video was not updated.'
    end
  end


  def destroy
    check_video_owner(@video)
    @video.destroy
    redirect_to videos_url, notice: 'Video was successfully destroyed.'
  end

  def upload
    video = Video.new(video_params)
    if user_signed_in?
      video.user = current_user
      if video.save
        render json: { status: :ok }
      else
        render json: { status: :error, errors: video.errors.messages }, status: 422
      end
    else
      render json: { status: :unforbiden }
    end
  end

  private

  def check_video_owner(video)
    unless user_signed_in? && video.user = current_user
      redirect_to new_user_session_path, alert: "User must be logged."
    end
  end

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :file)
  end

end