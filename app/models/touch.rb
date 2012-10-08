class Touch < ActiveRecord::Base
  attr_accessible :station_id, :touched_date, :user_id
  
  belongs_to :station
  
end
