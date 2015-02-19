class TvshowsController < ApplicationController
  def index
    @tvshows = Tvshow.all
  end
  def show
    @tvshows = Tvshow.all
  end

  def new
    @tvshow = Tvshow.find(params[:id])
    if @tvshow.show(tvshow_params)
      redirect_to (@tvshow)
    else
      render :new
    # respond_to do |format|
    #   format.json { render json: @tvshow}    
    end
  end

  def create
    @tvshow = Tvshow.new(tvshow_params)

    if @tvshow.save
      redirect_to tvshow_path
    else
      render :new
    # respond_to do |format|
    #   format.json { render json: @tvshow}
    end
  end


  private

  def tvshow_params
    params.require(:tvshow).permit(:title, :trakd_id)
  end
end
