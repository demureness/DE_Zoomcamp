select replace(zpu.zone, 'NA', 'Unknown') || '/' ||replace(zdo.zone, 'NA', 'Unknown') pickup_dropoff_pair, avg(total_amount)  average_price_ride  
  from yellow_taxi_data as y
  join zones as zdo
    on y."DOLocationID"=zdo."LocationID"
  join zones as zpu
    on y."PULocationID"=zpu."LocationID"
 group by replace(zpu.zone, 'NA', 'Unknown') || '/' ||replace(zdo.zone, 'NA', 'Unknown')
 order by avg(total_amount) desc
 limit 1;
