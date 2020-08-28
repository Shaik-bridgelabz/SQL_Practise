--Get vehicles based on the type of vehicle

select p.slot,p.vehicle_num,v.type from parking_lot_parking p inner join parking_lot_vehicletype v on p.vehicle_type_id=v.id;

--..........................................................................................................................................................................................

--Get all vehicles parked based on the matching parking type

 select p.slot,p.vehicle_num,v.type from parking_lot_parking p left join parking_lot_parkingtype v on p.parking_type_id=v.id;

--............................................................................................................................................................................................

--Get all users order_num,username and total quantity ordered

select username, sum(quantity), order_num from orders right join user on orders.user_id = user.id group by username;

--..................................................................................................................................................................................

--Select all users who have placed order for more than 5 products

select username,order_num from orders inner join user on orders.user_id = user.id group by username having count(*)>5;

--.........................................................................................................................................................................................

--Delete using left outer join

DELETE user_id FROM users LEFT JOIN orders ON users.user_id = orders.user_id  WHERE order_num IS NULL;

--.............................................................................................................................................................................................

-- Insert using left outer join

INSERT INTO  orders
SELECT cart.product_id,cart.quantity,users.user_id,cart.price 
FROM cart 
LEFT JOIN users
ON cart.user_id=users.user_id;

--..............................................................................................................................................................................................

--Update using left outer join

UPDATE cart LEFT JOIN
books ON cart.product_id = books.product_id 
SET cart.quantity = cart.qauntity + 2;
