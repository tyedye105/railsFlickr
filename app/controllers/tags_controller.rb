class TagsController < ApplicationController
  def new
    @users = User.all
    @image = Image.find(params[:image_id])
    @tag = @image.tags.new
  end

  def create
    @users = User.all
    @image = Image.find(params[:image_id])
    @tag = @image.tags.new(tag_params)
    if @image.save
      redirect_to image_path(@image)
    else
      render :new
    end
  end

private
  def tag_params
    params.require(:tag).permit(:user_id)
  end
end
