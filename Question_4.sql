--1
select tip_amount, tpep_dropoff_datetime
  from yellow_taxi_data
 order by tip_amount desc
 limit 1;
 
--2

 select tpep_dropoff_datetime
   from yellow_taxi_data
  where tip_amount = (select max(tip_amount) from yellow_taxi_data);

--3

with gb as ( 
 select sum(tip_amount) as sum_tip_amount, tpep_pickup_datetime
  from yellow_taxi_data
 group by tpep_pickup_datetime
	)
	select tpep_pickup_datetime
	  from gb
	 where sum_tip_amount = (select max(sum_tip_amount) from gb);

--4

with wf as (
	select rank() OVER (PARTITION BY tpep_pickup_datetime ORDER BY tip_amount DESC) as rn, tpep_pickup_datetime
	  from yellow_taxi_data
)
	select tpep_pickup_datetime, rn
	  from wf;
	  