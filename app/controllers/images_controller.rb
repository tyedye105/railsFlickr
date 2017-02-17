class ImagesController < ApplicationController
  def index
    @images = Image.all
    @user = current_user
  end

  def show
    @user = current_user
    @image = Image.find(params[:id])
    @tags = @image.tags.all
    @taggedUsers = []
    @tags.each do |tag|
      new_tag = User.find(tag.user_id)
      @taggedUsers.push(new_tag.username)
    end
  end

  def new
    @user = current_user
    @image = @user.images.new
  end

  def create
    @user = current_user
    @image = @user.images.new(image_params)
    if @user.save
      redirect_to '/'
    else
      render :new
    end
  end

  def edit
    @user = current_user
    @image = Image.find(params[:id])
  end
  def update
    @user = current_user
    @image = Image.find(params[:id])
      if @image.update(image_params)
        redirect_to image_path(@image)
      else
        render :edit
      end
    end
    def destroy
      @user = current_user
      @image = Image.find(params[:id])
      @image.destroy
      redirect_to images_path
    end

private
  def image_params
    params.require(:image).permit(:avatar, :title, :description)
  end
end
