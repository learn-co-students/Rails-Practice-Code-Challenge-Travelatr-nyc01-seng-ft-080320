class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(params.require(:post).permit(:title, :content, :likes, :destination_id, :blogger_id))
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(params.require(:post).permit(:title, :content, :likes, :destination_id, :blogger_id))
    redirect_to post_path(post)
  end

  def show
    @post = Post.find(params[:id])
  end

  def add_like
    @post = Post.find(params[:id])
    @post.likes += 1
    @post.save
    redirect_to post_path(@post)
  end
end
