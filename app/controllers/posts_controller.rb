class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = get_post
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(post_params)
        redirect_to post_path(@post)
    end

    def edit
        @post = get_post
    end

    def update
        @post = get_post
        @post.update(post_params)
        redirect_to post_path(@post)
    end

    def like
        @post = get_post
        @post.likes += 1
        redirect_to post_path(@post)
    end

    private

    def get_post
        Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
end
