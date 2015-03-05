class RefactorSynopsisAndRewrites < ActiveRecord::Migration
  def up
    add_column :tvshows, :official_synopsis, :string
  end
end
