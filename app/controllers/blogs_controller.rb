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
    if @blog.save
      redirect_to blogs_url, notice: 'ブログを作成しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_url, notice: 'ブログを更新しました'
    else
      render :new
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: 'ブログを削除しました'
  end

  def confirm
    @blog = Blog.new(blog_params)
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
