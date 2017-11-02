class PlacesController < ApplicationController

  def index
    # @places = Place.all
    @places = Place.paginate(:page => params[:page], :per_page => 1)
  end

end
