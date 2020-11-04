class GeolocationController < ApplicationController

  def sqlQuery()
    sql = "select b.administrator_full_name as nomadmin, 
                b.technical_contact_full_name as nomtech, 
                CONCAT(ad.number_and_street,' ', ad.city ,' ',ad.postal_code,' ', ad.country )  as addresse,
                # ad.latitude latitude,
                # ad.longitude longitude,
                bitem.nbbat,
                bitem.nbcol,
                bitem.nbelev
        from buildings b
        join addresses ad on ad.entity_id = b.customer_id
        join (
            select batitemcount.building_id, 
                count(batitemcount.bat_id) nbbat, 
                sum(batitemcount.nbcol) nbcol,
                sum(batitemcount.nbelev) nbelev
            from (
                SELECT bat.id bat_id, bat.building_id , 
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



  def index
  end
end
