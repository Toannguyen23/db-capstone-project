delimiter //
create procedure AddBooking(booking_id INT, CustomID INT, StaffID INT, Date date, Tab_num INT)
BEGIN
INSERT INTO bookings values(booking_id, CustomID, StaffID, Date, Tab_num);
SET @message = "New Booking Inserted";
SELECT @message as Confirm;
END //
