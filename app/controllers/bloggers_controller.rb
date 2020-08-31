class BloggersController < ApplicationController
    before_action :find_blogger, only: [:show, :edit, :update, :destroy]

  def index
    @bloggers = Blogger.all
  end

  def show
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.create(blogger_params)
      if @blogger.valid?
        flash[:success] = "Welcome!"  
    redirect_to blogger_path(@blogger)
      else
        flash[:my_errors] = @blogger.errors.full_messages
        redirect_to new_blogger_path 
      end
  end

  def edit
  end

  def update
    if @blogger.update(blogger_params)
    redirect_to blogger_path(@blogger)
    else
      flash[:my_errors] = @blogger.errors.full_message
      redirect_to edit_blogger_path(@blogger)
    end
  end

  def destroy
    @blogger.destroy 
    redirect_to bloggers_path 
  end

  private

  def find_blogger
    @blogger = Blogger.find(params[:id])
  end

  def blogger_params
    params.require(:blogger).permit(:name, :age, :bio)
  end

end
