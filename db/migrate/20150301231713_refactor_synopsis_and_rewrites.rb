class RefactorSynopsisAndRewrites < ActiveRecord::Migration
  def up
    add_column :tvshows, :official_synopsis, :string
  
  def down
    remove_column :synopsis_id, :integer
  end
end
