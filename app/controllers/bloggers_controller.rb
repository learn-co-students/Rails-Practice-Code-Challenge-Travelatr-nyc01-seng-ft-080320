class BloggersController < ApplicationController
  def new
    @blog = Blogger.new
  end

  def show
    @blog = Blogger.find(params[:id])
  end

  def create
    blog = Blogger.create(params.require(:blogger).permit(:name, :bio, :age))
    redirect_to blogger_path(blog)
  end
end
