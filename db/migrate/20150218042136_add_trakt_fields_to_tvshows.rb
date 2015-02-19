class AddTraktFieldsToTvshows < ActiveRecord::Migration
  def change
    add_column :tvshows, :title, :string
    add_column :tvshows, :poster_image, :string
    add_column :tvshows, :trakt_id, :integer
  end
end
