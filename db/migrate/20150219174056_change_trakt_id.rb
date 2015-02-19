class ChangeTraktId < ActiveRecord::Migration
  def change
    remove_column :tvshows, :trakt_id, :integer
    add_column :tvshows, :trakt_record, :integer
  end
end
