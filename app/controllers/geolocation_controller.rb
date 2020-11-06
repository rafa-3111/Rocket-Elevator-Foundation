class GeolocationController < ApplicationController
  before_action :authenticate_user!

  def index

   elevators = Elevator.all
  #  make data for google marker
   @places_list = []

  #  parcourir tous les Building

    Building.find_each do |building|

       address = building.address
       b = building.batteries.count
       bb = building.battery_ids
      #  number of column
       c = Column.where(battery_id: bb).count
       colu_id = Column.where(battery_id: building.battery_ids).ids
        #  number of elevators
       e = Elevator.where(column_id: colu_id).count   

       addcomp = " #{address.number_and_street}, #{address.city}, #{address.postal_code}"
       @lat = address.latitude
       @lng = address.longitude

      #  creation de la liste a exporter
 
       @places_list << {name: building.administrator_full_name, 
               lat: @lat, lng: @lng, 
               address: addcomp, 
               client: building.administrator_full_name, 
               battery: b, column: c, elevator: e,
               technician: building.technical_contact_full_name}
              
       end
       puts @places_list
      
   end
 end
 

