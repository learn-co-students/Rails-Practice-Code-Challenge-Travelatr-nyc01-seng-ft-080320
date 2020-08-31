class PostsController < ApplicationController

def show
    @post = Post.find(params[:id])
end

def edit
    @post = Post.find(params[:id])
end

def update 
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
        redirect_to post_path(@post)
    else
        flash[:errors] = @post.errors.full_messages
        render :edit
    end
end

def new
    @post = Post.new
end

def create
    @post = Post.create(post_params)
    if @post.valid?
        redirect_to post_path(@post)
    else
        #send error message
        flash[:errors] = @post.errors.full_messages
        render :new
    end
end

private

def post_params
    # params.require(:post).permit(:likes, :title, :content, :blogger_id, :destination_id)
    params.require(:post).permit!
end

end
