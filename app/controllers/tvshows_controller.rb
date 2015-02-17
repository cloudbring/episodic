class TvshowsController < ApplicationController
  def index
    @tvshows = Tvshow.all
  end

  def show
    @tvshow = Tvshow.find(params[:id])
    respond_to do |format|
      format.json { render json: @tvshow}    
  end

end
