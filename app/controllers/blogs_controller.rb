class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)

    if params[:back]
      render :new
    elsif @blog.save
      redirect_to blogs_url, notice: 'ブログを作成しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if params[:back]
      render :edit
    elsif @blog.update(blog_params)
      redirect_to blogs_url, notice: 'ブログを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: 'ブログを削除しました'
  end
  
  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    if params[:back]
      params.require(:blog).permit(:title, :content)
    else
      params.require(:blog).permit(:title, :content, :confirming)
    end
  end
end
