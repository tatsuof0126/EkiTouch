class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.integer :rr_cd
      t.integer :line_cd
      t.integer :station_cd
      t.integer :line_sort
      t.integer :station_sort
      t.integer :station_g_cd
      t.integer :r_type
      t.string :rr_name
      t.string :line_name
      t.string :station_name
      t.integer :pref_cd
      t.float :lon
      t.float :lat
      t.integer :f_flag

      t.timestamps
    end
  end
end
