class AddTvshowIdToSynopsis < ActiveRecord::Migration
  def change
    add_column :synopses, :tvshow_id, :integer
  end
end
