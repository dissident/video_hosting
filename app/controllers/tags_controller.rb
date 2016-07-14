class TagsController < ApplicationController

  def create
    @tag = Tag.find_by(title: tag_params[:title])
    @tag = Tag.new(tag_params.except(:video_id)) if @tag.blank?
    unless @tag.video_ids.include?(tag_params[:video_id].to_i)
      @tag.videos << Video.find(tag_params[:video_id])
    end
    if @tag.save
      redirect_to videos_path, notice: 'Tag was successfully created.'
    else
      redirect_to videos_path, alert: 'Tag was not created.'
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.video_ids -= [params[:video].to_i]
    @tag.save
    redirect_to videos_url, notice: 'Tag was successfully deleted.'
  end


  private

  def tag_params
    params.require(:tag).permit(:title, :video_id)
  end

end