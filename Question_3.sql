select count(1)
  from yellow_taxi_data
 where date(tpep_pickup_datetime) = '2021-01-15';
 