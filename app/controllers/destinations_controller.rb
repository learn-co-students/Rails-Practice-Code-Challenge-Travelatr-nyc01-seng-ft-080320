class DestinationsController < ApplicationController

    def index
        @destinations = Destination.all
    end

    def show
        @destination = get_destination
    end

    private

    def get_destination
        Destination.find(params[:id])
    end

end
