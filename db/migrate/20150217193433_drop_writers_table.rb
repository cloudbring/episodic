class DropWritersTable < ActiveRecord::Migration
  def change
    drop_table :writers
  end
end
