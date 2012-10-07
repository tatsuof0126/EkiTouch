class NearStationController < ApplicationController

  MAX_DISTANCE = 2000     #最大検索範囲
  LAT1_DISTANCE = 110.953 #北緯0.001度あたりの距離（m）
  LON1_DISTANCE = 90.525  #東経0.001度あたりの距離（m）

  def findnearest
    herelat = params[:herelat].to_f #北緯
    herelon = params[:herelon].to_f #東経
    paramdistance = params[:distance].to_i #検索範囲
    
    neareststation = nil
    nearestdistance = MAX_DISTANCE
    if paramdistance != 0 && nearestdistance > paramdistance
      nearestdistance = paramdistance
    end
    
#    stations = Station.all

    search_lat = nearestdistance / LAT1_DISTANCE / 1000
    search_lon = nearestdistance / LON1_DISTANCE / 1000
    
    stations = Station.find(:all, :conditions=>[ "lat between ? and ? and lon between ? and ?", 
      herelat-search_lat, herelat+search_lat, herelon-search_lon, herelon+search_lon])
    
    
    for station in stations do 
      distance = calcdistance(herelat, herelon, station.lat, station.lon)

      p distance
      
      if nearestdistance > distance 
        station.distance = distance
        neareststation = station
        nearestdistance = distance        
      end
    end
    
    if neareststation != nil
      p '---'
      p nearestdistance
      p neareststation.station_name
      p '---'
    end
    
    render json: neareststation
  end

  def find
    herelat = params[:herelat].to_f #北緯
    herelon = params[:herelon].to_f #東経
    paramdistance = params[:distance].to_i #検索範囲
    
    neardistance = MAX_DISTANCE
    if paramdistance != 0 && neardistance > paramdistance
      neardistance = paramdistance
    end
    
#    stations = Station.all
    
    search_lat = neardistance / LAT1_DISTANCE / 1000
    search_lon = neardistance / LON1_DISTANCE / 1000
    
    stations = Station.find(:all, :conditions=>[ "lat between ? and ? and lon between ? and ?", 
      herelat-search_lat, herelat+search_lat, herelon-search_lon, herelon+search_lon])
    
    nearstations = []
    
    for station in stations do 
      distance = calcdistance(herelat, herelon, station.lat, station.lon)

#      p '---' 
#      p station.station_name
#      p distance
      
      if neardistance > distance
        station.distance = distance
        nearstations << station
        
        p station.station_name
        p station.distance
        p 'added'
      end
    end
    
    render json: nearstations
  end
  
  def calcdistance(fromlat, fromlon, tolat, tolon)
    diflat = (fromlat - tolat) * LAT1_DISTANCE * 1000
    diflon = (fromlon - tolon) * LON1_DISTANCE * 1000
    
    # 三平方の定理で直線距離を計算
    distance = Math.sqrt(diflat**2 + diflon**2)
      
    return distance
  end

end
