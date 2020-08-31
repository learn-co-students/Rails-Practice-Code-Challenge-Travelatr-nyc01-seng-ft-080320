class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all 
    end

    def show 
        @blogger = get_blogger
    end

    private

    def get_blogger
        Blogger.find(params[:id])
    end

end
