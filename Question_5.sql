select zdo.zone, count(1)
  from yellow_taxi_data as y
  join zones as zdo
    on y."DOLocationID"=zdo."LocationID"
  join zones as zpu
    on y."PULocationID"=zpu."LocationID"
 where date(tpep_pickup_datetime) = '2021-01-14'
   and zpu.zone = 'Central Park'
 group by zdo.zone
 order by count(1) desc
 limit 1;
