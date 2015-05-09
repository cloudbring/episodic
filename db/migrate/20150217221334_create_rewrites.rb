class CreateRewrites < ActiveRecord::Migration
  def change
    create_table :rewrites do |t|
      t.string :body
      t.integer :synopsis_id
      t.timestamps null: false
    end
  end
end
