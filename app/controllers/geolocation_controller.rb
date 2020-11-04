class GeolocationController < ApplicationController
   before_action :authenticate_user!

  def sqlQuery()
    sql = "select b.administrator_full_name as nomadmin, 
                b.technical_contact_full_name as nomtech, 
                CONCAT(ad.number_and_street,' ', ad.city ,' ',ad.postal_code,' ', ad.country )  as address,
                 ad.latitude latitude,
                ad.longitude longitude,
                bitem.nbbat,
                bitem.nbcol,
                bitem.nbelev
        from buildings b
        join addresses ad on ad.id = b.customer_id
        join (
            select batitemcount.building_id, 
                count(batitemcount.bat_id) nbbat, 
                sum(batitemcount.nbcol) nbcol,
                sum(batitemcount.nbelev) nbelev
            from (
                SELECT bat.id bat_id, bat.building_id, 
                    count(col.id) nbcol,
                    (
                        select count(e.id) nbelev from `columns` c 
                        join elevators e on e.column_id  = c.id
                        where c.battery_id = bat.id
                        GROUP by c.battery_id
                    ) nbelev
                from batteries bat 
                join `columns` col on col.battery_id = bat.id 
                GROUP by bat.id, bat.building_id 
            ) as batitemcount
            GROUP by batitemcount.building_id
        ) as bitem on bitem.building_id = b.id"
    return sql

    
  end 


  def executeQuery()
      
    results = ActiveRecord::Base.connection.execute(sqlQuery())
  
  if results.present? 
      rep =[]

    return results.as_json
  else
    return nil

    if results.present? 
        rep =[]
      return results.as_json
      else
        return nil
    end
  end
end

def index
  @hashResults = executeQuery()
  @hashResults.inspect
  @hash = Gmaps4rails.build_markers(@hashResults) do |res, marker|
        
            marker.lat res[3]
            marker.lng res[4]          
            marker.infowindow "<h5><font color='#3498db'>" + res[0] +"</font></h5> Technician name: "+ res[1]  +"</br>Address: "+ res[2] +"</br>Number of batteries: "+ res[5].to_s + "</br>Number of columns: " + res[6].to_s + "</br> Number of elevators: " + res[7].to_s        
  
        end 
  end
end
