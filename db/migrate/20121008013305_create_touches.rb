class CreateTouches < ActiveRecord::Migration
  def change
    create_table :touches do |t|
      t.integer :user_id
      t.integer :station_id
      t.datetime :touched_date

      t.timestamps
    end
  end
end
