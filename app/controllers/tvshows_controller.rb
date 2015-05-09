class TvshowsController < ApplicationController
  def index
    @tvshows = Tvshow.all
  end

  def show
    @tvshow = Tvshow.find(params[:id])
  end

  def new
    @tvshow = Tvshow.find(params[:id])
    if @tvshow.show(tvshow_params)
      redirect_to (@tvshow)
    else
      render :new
    end
  end

  def create
    @tvshow = Tvshow.new(tvshow_params)

    if @tvshow.save
      redirect_to tvshow_path
    else
      render :new
    end
  end

  def update
      @tvshow = Tvshow.find(params[:id])
      if @tvshow.update_attributes(tvshow_params)
         redirect_to :action => 'show', :id => @tvshow
      else
         render :action => 'edit'
      end
   end


  private

  def tvshow_params
    params.require(:tvshow).permit(:airs_time, :airs_timezone, :runtime, :certification, :network, :status, 
                                   :aired_episodes, :title, :year, :trakt_record, :official_synopsis)
  end
end
