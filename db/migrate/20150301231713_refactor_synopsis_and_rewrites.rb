class RefactorSynopsisAndRewrites < ActiveRecord::Migration
  def up
    add_column :tvshows, :official_synopses, :string
    add_column :rewrites, :tvshow_id, :integer
  end
  
  def down
    drop_table :rewrites
  end
end
