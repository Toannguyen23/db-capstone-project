delimiter //
create procedure CheckBooking(booking_date date, num_tab INT)
begin
declare has_booking boolean default false;
select count(*) into has_booking from bookings
where date = booking_date and tableNumber = num_tab;
if has_booking THEN
select concat("Table", " ", num_tab, " ", "has booked") AS "Booking Status";
else
select concat("Table", " ", num_tab, " ", "has not booked yet") AS "Booking Status";
end if;
end//