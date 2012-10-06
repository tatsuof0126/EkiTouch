class NearStationController < ApplicationController

  def findnearest
    herelat = params[:herelat].to_f #北緯
    herelon = params[:herelon].to_f #東経

    stations = Station.all
    
    neareststation = nil
    nearestdistance = 2000
    
    for station in stations do 
      distance = calcdistance(herelat, herelon, station.lat, station.lon)

      p distance
      
      if nearestdistance > distance 
        station.distance = distance
        neareststation = station
        nearestdistance = distance        
      end
    end
    
    p '---'
    p nearestdistance
    p neareststation.station_name
    p '---'
    
    render json: neareststation
  end

  def find
    herelat = params[:herelat].to_f #北緯
    herelon = params[:herelon].to_f #東経

    stations = Station.all
    
    nearstations = []
    neardistance = 2000 # 近いと見なす距離
    
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
    # 0.001ずらしたときの距離
    # 南北110.953(m)
    # 東西90.525(m)
    latdistance = 110.953
    londistance = 90.525
    
    diflon = (fromlon - tolon) * londistance * 1000
    diflat = (fromlat - tolat) * latdistance * 1000
    
    # 三平方の定理で直線距離を計算
    distance = Math.sqrt(diflon**2 + diflat**2)
      
    return distance
  end

end
