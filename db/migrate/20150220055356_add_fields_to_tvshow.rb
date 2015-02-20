class AddFieldsToTvshow < ActiveRecord::Migration
  def change
    # "title" => Already here
    # "overview" => "synopsis.official"
    # "airs_day"
    # "airs_time"
    # "airs_timezone"
    # "runtime"
    # "certification"
    # "network"
    # "status"
    # "genres" => Requires another table to implement - FML
    # "aired_episodes"
    add_column :tvshows, :airs_day, :string
    add_column :tvshows, :airs_time, :string
    add_column :tvshows, :airs_timezone, :string
    add_column :tvshows, :runtime, :integer
    add_column :tvshows, :certification, :string
    add_column :tvshows, :network, :string
    add_column :tvshows, :status, :string
    add_column :tvshows, :aired_episodes, :integer
  end
end
