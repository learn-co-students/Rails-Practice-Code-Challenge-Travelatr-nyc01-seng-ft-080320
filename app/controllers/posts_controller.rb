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
        if @post.valid?
            redirect_to post_path(@post)
        else
            flash[:my_errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def edit
        @post = get_post
    end

    def update
        @post = get_post
        @post.update(post_params)
        if @post.valid?
            redirect_to post_path(@post)
        else
            flash[:my_errors] = @post.errors.full_messages
            redirect_to edit_post_path 
        end
    end

    private

    def get_post
        Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
end
