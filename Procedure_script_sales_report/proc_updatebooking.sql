delimiter //
create procedure UpdateBooking (booking_id INT, booking_date date)
begin 
UPDATE bookings SET Date = booking_date where bookingID = booking_id; 
SELECT concat("Booking"," ",booking_id, " ","updated") as Status;
end //
