class Station < ActiveRecord::Base
  attr_accessible :f_flag, :lat, :line_cd, :line_name, :line_sort, :lon, :pref_cd, :r_type, :rr_cd, :rr_name, :station_cd, :station_g_cd, :station_name, :station_sort
end
