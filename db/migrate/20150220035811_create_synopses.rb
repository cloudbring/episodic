class CreateSynopses < ActiveRecord::Migration
  def change
    create_table :synopses do |t|
      t.string :official

      t.timestamps null: false
    end
  end
end
