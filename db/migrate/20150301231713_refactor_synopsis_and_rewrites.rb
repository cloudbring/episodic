class RefactorSynopsisAndRewrites < ActiveRecord::Migration
  def up
    add_column :tvshows, :official_synopses, :string
    add_column :rewrites, :tvshow_id, :integer
  end
  
  def down
    remove_column :synopsis_id, :integer
    drop_table :synopses
  end
end
