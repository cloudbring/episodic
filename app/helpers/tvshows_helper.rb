module TvshowsHelper
  def airs(tvshow)
    # *Airs:* Sundays, 9:00PM ET on CBS (60 min)
    airs_html = "<em>Airs:</em>"
    airs_html << " %s," % tvshow.airs_day if tvshow.airs_day
    airs_html << " %s CT" % tvshow.airs_time if tvshow.airs_time
    airs_html << " on %s" % tvshow.network if tvshow.network
    airs_html << " (%s min)" % tvshow.runtime if tvshow.runtime
  end
end
