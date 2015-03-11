class AddFieldsToTvshow < ActiveRecord::Migration
  def change
    add_column :tvshows, :airs_day, :string
    add_column :tvshows, :airs_time, :string
    add_column :tvshows, :airs_timezone, :string
    add_column :tvshows, :runtime, :integer
    add_column :tvshows, :certification, :string
    add_column :tvshows, :network, :string
    add_column :tvshows, :status, :string
    add_column :tvshows, :aired_episodes, :integer
    add_column :tvshows, :synopsis, :string
  end
end
