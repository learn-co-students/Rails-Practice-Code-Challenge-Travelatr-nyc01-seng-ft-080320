class BloggersController < ApplicationController

def index
    @bloggers = Blogger.all
end

def show
    @blogger = Blogger.find(params[:id])
end

def new
    
end


def create
end

end
