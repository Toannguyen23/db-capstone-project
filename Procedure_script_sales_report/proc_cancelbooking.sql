delimiter //
create procedure CancelBooking(booking_id INT)
BEGIN
DELETE FROM bookings where bookingID = booking_id;
SELECT concat("Booking ID", " ", booking_id," " , "canceled") AS Status;
END //