class VideosController < ApplicationController

  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @videos = current_user.videos
    else
      redirect_to new_user_session_path, alert: "User must be logged."
    end
  end

  def show
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to @video, notice: 'Video was successfully created.'
    else
      render :new
    end
  end

  def update
    if @video.update(video_params)
      redirect_to @video, notice: 'Video was successfully updated.'
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
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
        render json: { status: :error, errors: video.errors.messages }
      end
    else
      render json: { status: :unforbiden }
    end
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :file)
  end

end