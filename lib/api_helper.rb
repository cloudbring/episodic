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

  def self.get_tvshows(results)
    if(results != nil && results.class == 'Array')
      results
        .select { |result| result['type'] == 'show' }
    end
  end

  def self.get_search_result_ids(results)
      # Only get TV Shows
      # Get an Array<Int> of Trakt_ids
  end

end
