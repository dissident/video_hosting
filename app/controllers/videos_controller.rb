class VideosController < ApplicationController

  def index
    @videos = Video.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def delete
  end

end