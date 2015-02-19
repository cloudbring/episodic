class ApiHelper
  def self.add_results_to_db!(results)
    if(results != nil && results.class == 'Array')
      results
        .select{ |result| result['type'] == 'show' }
        .each{ |result| save_or_update_show!(result['show']) }
        # Get TV Shows from Results Object
        # Make TVShow Model records from TV Show Objects
    end
  end

  private

  def save_or_update_show!(show)
    #t.string   "title"
    #t.string   "poster_image"
    #t.integer  "trakt_id"
    tv_show = TVShow.find_or_initalize_by_trakt_id(show['ids']['trakt_id'])
    tv_show.update_attributes(
      :title => show['title'],
      :poster_image => get_best_show_image(show['images']),
      :trakt_id => show['ids']['trackt']
    )
    tv_show.save!
  end

  def get_best_show_image(images)
    images['medium']
  end
end
