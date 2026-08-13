Simulation Results
Simulation Overview

The Hotel Booking System was verified using a SystemVerilog testbench.

The testbench checks:

System reset
Successful room booking
Attempt to book an already-booked room
Successful room cancellation
Attempt to cancel an available room
Multiple room bookings
Available-room counter
Expected Results

After reset:

Available rooms = 8

Test 1 — Book Room 2
Booking success = 1
Available rooms = 7


Room 2 changes from AVAILABLE to BOOKED.

Test 2 — Book Room 2 Again
Booking success = 0
Available rooms = 7


The booking is rejected because Room 2 is already booked.

Test 3 — Book Room 5
Booking success = 1
Available rooms = 6


Room 5 becomes booked.

Test 4 — Cancel Room 2
Cancellation success = 1
Available rooms = 7


Room 2 becomes available again.

Test 5 — Cancel Room 2 Again
Cancellation success = 0
Available rooms = 7


The cancellation is rejected because Room 2 is already available.

Test 6 — Book Room 0
Booking success = 1
Available rooms = 6

Test 7 — Book Room 1
Booking success = 1
Available rooms = 5

Expected Final State

At the end of the test:

Room	Status
0	Booked
1	Booked
2	Available
3	Available
4	Available
5	Booked
6	Available
7	Available

Therefore:

Total rooms = 8
Booked rooms = 3
Available rooms = 5

Waveform

The generated VCD waveform should show the following important signals:

clk
reset_n
book
cancel
room_id
booking_success
cancellation_success
room_booked
available_rooms


The waveform can be viewed using GTKWave.

Command:

gtkwave hotel_booking.vcd

Conclusion

The simulation verifies that the hotel booking system correctly handles room booking and cancellation. The system prevents duplicate bookings and invalid cancellations while maintaining the correct number of available rooms.