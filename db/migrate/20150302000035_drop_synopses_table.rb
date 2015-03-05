class DropSynopsesTable < ActiveRecord::Migration
  def change
    drop_table :synopses
  end
end
