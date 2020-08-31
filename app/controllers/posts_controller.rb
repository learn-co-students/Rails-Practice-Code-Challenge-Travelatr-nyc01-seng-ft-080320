class PostsController < ApplicationController
    before_action :find_post, only:[:edit, :update, :show]

    def index
        @posts = Posts.all
    end

    def new
        @post = Post.new
    end

    def create
        #byebug
        post = Post.create(post_params)
        if post.valid?
            post.update(likes: 0)
            redirect_to post_path(post)
        else
            flash[:errors] = post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def edit

    end

    def update
        if !params[:post]
            @post.update(likes: @post.likes + 1)
            redirect_to post_path(@post)
        else
            if Post.update(post_params)
                redirect_to post_path(@post)
            else
                flash[:errors] = @post.errors.full_messages
                redirect_to edit_post_path(@post)
            end
        end
    end

    def show

    end

    private

    def find_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
    end

end
