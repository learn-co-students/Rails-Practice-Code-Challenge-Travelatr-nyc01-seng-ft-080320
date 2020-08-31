class PostsController < ApplicationController

    def index 
        @posts = Post.all
    end 

    def new 
        @post = Post.new
    end 

    def show 
        @post = Post.find(params[:id])
    end 
    def create
        @post = Post.create(posts_params)

        if @post.valid?
            redirect_to post_path(@post)
        else 
            flash[:my_errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end 

    def edit 
        @post = Post.find(params[:id])
    end 

    def update 
        @post= Post.find(params[:id])
        @post.update(posts_params)

        if @post.valid?
            redirect_to post_path(@post)
        else 
            flash[:my_errors] = @post.errors.full_messages
            redirect_to edit_post_path
        end
        
    end



    private 
    def posts_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end 

end 

