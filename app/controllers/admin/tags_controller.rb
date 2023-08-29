class Admin::TagsController < ApplicationController
  def index
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_path
    else
      render :index
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    if @tag.destroy
      redirect_to admin_tags_path
    else
      render :index
    end
  end

  def search
    @tags = Tag.all
    @tag = Tag.new(tag_params)
    if @tag.category.present?
      @tag = Tag.where('category = ?', "#{@tag.category}}")
    else
      @tag = Tag.none
    end
      render :index
  end

  private

  def tag_params
    params.require(:tag).permit(:category, :item)
  end

end
