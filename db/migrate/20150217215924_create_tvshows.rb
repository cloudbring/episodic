class CreateTvshows < ActiveRecord::Migration
  def change
    create_table :tvshows do |t|

      t.timestamps null: false
    end
  end
end
