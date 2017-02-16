class ImagesController < ApplicationController
  def index
    @images = Image.all
    @user = current_user
  end

  def show
    @user = current_user
    @image = Image.find(params[:id])
  end

  def new
    @user = current_user
    @image = @user.images.new
  end

  def create
    @user = current_user
    @image = @user.images.new(image_params)

    if @user.save
      binding.pry
      redirect_to '/'
    else
      render :new
    end
  end

private
  def image_params
    params.require(:image).permit(:avatar, :title, :description)
  end
end
