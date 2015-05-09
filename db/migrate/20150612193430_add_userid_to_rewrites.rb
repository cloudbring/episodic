class AddUseridToRewrites < ActiveRecord::Migration
  def change
    add_column :rewrites, :user_id, :string
  end
end
