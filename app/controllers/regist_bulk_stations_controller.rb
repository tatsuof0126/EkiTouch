class RegistBulkStationsController < ApplicationController

  def create
    inputtext = params[:inputtext]
    
    inputtext.each_line { |line| 
      line = line.chomp
      stationstr = line.split(",")

#      p line
#      p stationstr.length
      
      station = Station.new
      station.rr_cd = stationstr[0]
      station.line_cd = stationstr[1]
      station.station_cd = stationstr[2]
      station.line_sort = stationstr[3]
      station.station_sort = stationstr[4]
      station.station_g_cd = stationstr[5]
      station.r_type = stationstr[6]
      station.rr_name = stationstr[7]
      station.line_name = stationstr[8]
      station.station_name = stationstr[9]
      station.pref_cd = stationstr[10]
      station.lon = stationstr[11].to_f
      station.lat = stationstr[12].to_f
      station.f_flag = stationstr[13]
      
      station.save
    }
    
    
    stationscount = Station.count
    
    render json: stationscount
  end

end
