--SQL Views

--CREATE VIEW Syntax

CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

--SQL CREATE VIEW Example

create view user1vehicles as
select vehicle_num,entry_time from parking_lot_parking
where user=(select username from parking_lot_user where id=1);

--We can query the view above as follows:

SELECT * FROM user1vehicles;

--..................................................................................................................

create view getslot as
select vehicle_num,slot from parking_lot_parking
order by slot;

SELECT * FROM getslot;

--.................................................................................................................

create view getcars as
select vehicle_num,slot from parking_lot_parking
where vehicle_type_id=(
select id from parking_lot_vehicletype where type='car')
order by slot;

SELECT * FROM getcars;

--.................................................................................................................

/*SQL Updating a View
A view can be updated with the CREATE OR REPLACE VIEW command.
*/

--SYNTAX:

CREATE OR REPLACE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

--.................................................................................................................

--Example
create or replace view getcars as
select vehicle_num,slot,type from parking_lot_parking p
inner join parking_lot_vehicletype t
on p.vehicle_type_id=t.id
where t.type='car'
order by p.slot;

SELECT * FROM getcars;

--.................................................................................................................

--SQL DROP VIEW Syntax

DROP VIEW view_name;

--Example

DROP VIEW user1vehicles;

--.................................................................................................................