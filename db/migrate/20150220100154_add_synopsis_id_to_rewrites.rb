class AddSynopsisIdToRewrites < ActiveRecord::Migration
  def change
    add_column :rewrites, :synopsis_id, :integer
  end
end
