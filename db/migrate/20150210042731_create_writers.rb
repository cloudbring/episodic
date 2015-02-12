class CreateWriters < ActiveRecord::Migration
  def change
    create_table :writers do |t|
      t.string :email
      t.string :username
      t.string :password

      t.timestamps null: false
    end
  end
end
