delimiter //
create procedure AddvalidBooking(booking_date date, num_tab int)
BEGIN
DECLARE Status INT default FALSE;
SELECT COUNT(*) INTO status from bookings where date = booking_date and tableNumber = num_tab;

IF Status > 0 THEN
START TRANSACTION;
SELECT concat("Table"," ", num_tab, "already booked", " ", "canceled booking") AS Status;
ROLLBACK;
START TRANSACTION;
INSERT INTO bookings (BookingID,CustomerID,StaffID,date,tableNumber) values(7,2,1,booking_date, num_tab);
COMMIT;
ELSE
START TRANSACTION;
INSERT INTO bookings (BookingID,CustomerID,StaffID,date,tableNumber) values(7,2,1,booking_date, num_tab);
COMMIT;
END IF;
END//