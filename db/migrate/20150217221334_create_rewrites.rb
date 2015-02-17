class CreateRewrites < ActiveRecord::Migration
  def change
    create_table :rewrites do |t|
      t.string :body

      t.timestamps null: false
    end
  end
end
