--Syntax For Case:

CASE
    WHEN ComparsionCondition THEN result
    WHEN ComparsionCondition THEN result
    ELSE other
 END

--..........................................................................................................................................................................................................................

--using case to tell the user in which floor vehicle is parked

Select vehicle_num,
CASE
WHEN slot>0 AND slot <50
THEN 'Vehicle is in First Floor'
WHEN slot>=50 AND slot<=100
THEN 'Vehicle is in Second FLoor'
Else 'Vehicle is Not Parked'
END AS Floor
from parking_lot_parking;

--...........................................................................................................................................................................................................................
--Procedure using Case

create procedure check_floor(in vehicle_num varchar(10), out floor varchar(100)
begin
declare veh_slot int
select slot from parking_lot_parking where vehicle_num=vehicle_num;
CASE
WHEN slot>0 AND slot <50
THEN 'Vehicle is in First Floor'
WHEN slot>=50 AND slot<=100
THEN 'Vehicle is in Second FLoor'
Else 'Vehicle is Not Parked'
END case
end;

--................................................................................................................................................................................................................................
