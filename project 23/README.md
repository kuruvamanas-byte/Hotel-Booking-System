Hotel Booking System Using SystemVerilog
1. Project Overview

The Hotel Booking System is a digital hardware project designed using SystemVerilog. The system manages hotel room reservations by keeping track of available and booked rooms.

The project demonstrates important digital-design concepts such as:

Sequential logic
Counters
Registers
Finite-state/control logic
Input validation
Booking and cancellation operations
SystemVerilog testbench verification
Simulation and waveform analysis

The design can be simulated using tools such as Icarus Verilog, Verilator, QuestaSim, ModelSim, or Vivado.

2. Objective

The main objective of this project is to design a simple hardware-based hotel room management system.

The system allows a user to:

Select a room.
Book an available room.
Cancel an existing booking.
Check whether a room is available.
Monitor the total number of available rooms.
3. Features
Supports 8 hotel rooms.
Each room can have two states:
0 = Available
1 = Booked
Allows room booking.
Allows room cancellation.
Prevents booking an already-booked room.
Prevents cancellation of an available room.
Provides a booking-success signal.
Provides a cancellation-success signal.
Provides the number of available rooms.
Synchronous operation using a clock.
Active-low reset.
4. Inputs
Signal	Width	Description
clk	1	System clock
reset_n	1	Active-low reset
book	1	Request to book a room
cancel	1	Request to cancel a room
room_id	3	Room number from 0 to 7
5. Outputs
Signal	Width	Description
booking_success	1	Indicates successful booking
cancellation_success	1	Indicates successful cancellation
room_booked	1	Indicates selected room is booked
available_rooms	4	Number of available rooms
6. Room Numbering

The system contains eight rooms:

Room ID	Status after reset
0	Available
1	Available
2	Available
3	Available
4	Available
5	Available
6	Available
7	Available

After a successful booking, the selected room changes from Available to Booked.

7. Operating Principle
Booking

When book = 1, the system checks the selected room.

If the room is available:

booking_success = 1
room status = BOOKED
available_rooms = available_rooms - 1


If the room is already booked:

booking_success = 0

Cancellation

When cancel = 1, the system checks the selected room.

If the room is booked:

cancellation_success = 1
room status = AVAILABLE
available_rooms = available_rooms + 1


If the room is already available:

cancellation_success = 0

8. Block Diagram
                 +------------------+
                 |      Clock       |
                 +--------+---------+
                          |
                          v
+-------------+     +------------+     +------------------+
|   Book      |---->|            |---->| Booking Success  |
+-------------+     |            |     +------------------+
                    |   Hotel    |
+-------------+     |   Booking  |---->| Cancellation     |
|   Cancel    |---->|   Control  |     | Success          |
+-------------+     |            |     +------------------+
                    |            |
+-------------+     |            |---->| Room Status      |
|   Room ID   |---->|            |     +------------------+
+-------------+     +-----+------+ 
                          |
                          v
                    +------------+
                    | Room State |
                    |  Register  |
                    +------------+
                          |
                          v
                    +------------+
                    | Available  |
                    |   Rooms    |
                    +------------+

9. Files
src/hotel_booking_system.sv

Contains the main RTL design.

tb/hotel_booking_system_tb.sv

Contains the SystemVerilog testbench used to verify the design.

simulation/simulation_results.md

Contains expected simulation behavior and test cases.

10. How to Simulate Using Icarus Verilog

Install Icarus Verilog and run:

iverilog -g2012 -o hotel_sim src/hotel_booking_system.sv tb/hotel_booking_system_tb.sv


Run the simulation:

vvp hotel_sim


A waveform file named hotel_booking.vcd will be generated.

Open the waveform using GTKWave:

gtkwave hotel_booking.vcd

11. Expected Test Cases
Test	Operation	Room	Expected Result
1	Reset	-	8 rooms available
2	Book	2	Booking successful
3	Book same room	2	Booking rejected
4	Book	5	Booking successful
5	Cancel	2	Cancellation successful
6	Cancel same room	2	Cancellation rejected
7	Book	0	Booking successful
8	Book	1	Booking successful
12. Example Simulation

After reset:

Available Rooms = 8


Book room 2:

Booking room 2
Booking successful
Available Rooms = 7


Try booking room 2 again:

Booking room 2
Booking rejected - room already booked
Available Rooms = 7


Cancel room 2:

Cancelling room 2
Cancellation successful
Available Rooms = 8

13. Future Improvements

The basic design can be extended with:

Customer ID
Check-in date
Check-out date
Room type
Room price
Payment status
LCD/7-segment display
Keypad input
FPGA implementation
UART communication
Multiple room categories
VIP room management
Automatic billing
14. Applications

This project can be used as a demonstration of:

FPGA-based digital systems
RTL design
SystemVerilog programming
Hardware verification
Finite-state machine concepts
Hotel/room management automation
15. Author

Hotel Booking System – Digital Design Project

Implemented using SystemVerilog RTL and simulation.