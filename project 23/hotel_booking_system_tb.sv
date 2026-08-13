`timescale 1ns/1ps

module hotel_booking_system_tb;

    logic       clk;
    logic       reset_n;
    logic       book;
    logic       cancel;
    logic [2:0] room_id;

    logic       booking_success;
    logic       cancellation_success;
    logic       room_booked;
    logic [3:0] available_rooms;


    // Instantiate DUT
    hotel_booking_system dut (
        .clk(clk),
        .reset_n(reset_n),
        .book(book),
        .cancel(cancel),
        .room_id(room_id),
        .booking_success(booking_success),
        .cancellation_success(cancellation_success),
        .room_booked(room_booked),
        .available_rooms(available_rooms)
    );


    // Clock generation
    initial begin
        clk = 0;

        forever #5 clk = ~clk;
    end


    // Test sequence
    initial begin

        // Generate waveform
        $dumpfile("hotel_booking.vcd");
        $dumpvars(0, hotel_booking_system_tb);


        // Initial values
        reset_n = 0;
        book    = 0;
        cancel  = 0;
        room_id = 0;


        // Reset
        #12;

        reset_n = 1;

        #10;

        $display("-------------------------------------");
        $display("Hotel Booking System Simulation");
        $display("-------------------------------------");

        $display("After reset:");
        $display("Available rooms = %0d", available_rooms);


        // ------------------------------------------------
        // Test 1: Book room 2
        // ------------------------------------------------

        room_id = 3'd2;
        book = 1;

        #10;

        book = 0;

        $display("");
        $display("Test 1: Book Room 2");
        $display("Booking success = %b", booking_success);
        $display("Available rooms = %0d", available_rooms);


        // ------------------------------------------------
        // Test 2: Try to book room 2 again
        // ------------------------------------------------

        #10;

        room_id = 3'd2;
        book = 1;

        #10;

        book = 0;

        $display("");
        $display("Test 2: Book Room 2 Again");
        $display("Booking success = %b", booking_success);
        $display("Available rooms = %0d", available_rooms);


        // ------------------------------------------------
        // Test 3: Book room 5
        // ------------------------------------------------

        #10;

        room_id = 3'd5;
        book = 1;

        #10;

        book = 0;

        $display("");
        $display("Test 3: Book Room 5");
        $display("Booking success = %b", booking_success);
        $display("Available rooms = %0d", available_rooms);


        // ------------------------------------------------
        // Test 4: Cancel room 2
        // ------------------------------------------------

        #10;

        room_id = 3'd2;
        cancel = 1;

        #10;

        cancel = 0;

        $display("");
        $display("Test 4: Cancel Room 2");
        $display("Cancellation success = %b",
                 cancellation_success);
        $display("Available rooms = %0d", available_rooms);


        // ------------------------------------------------
        // Test 5: Cancel room 2 again
        // ------------------------------------------------

        #10;

        room_id = 3'd2;
        cancel = 1;

        #10;

        cancel = 0;

        $display("");
        $display("Test 5: Cancel Room 2 Again");
        $display("Cancellation success = %b",
                 cancellation_success);
        $display("Available rooms = %0d", available_rooms);


        // ------------------------------------------------
        // Test 6: Book room 0
        // ------------------------------------------------

        #10;

        room_id = 3'd0;
        book = 1;

        #10;

        book = 0;

        $display("");
        $display("Test 6: Book Room 0");
        $display("Booking success = %b", booking_success);
        $display("Available rooms = %0d", available_rooms);


        // ------------------------------------------------
        // Test 7: Book room 1
        // ------------------------------------------------

        #10;

        room_id = 3'd1;
        book = 1;

        #10;

        book = 0;

        $display("");
        $display("Test 7: Book Room 1");
        $display("Booking success = %b", booking_success);
        $display("Available rooms = %0d", available_rooms);


        // Finish simulation
        #20;

        $display("");
        $display("-------------------------------------");
        $display("Simulation Completed");
        $display("-------------------------------------");

        $finish;

    end

endmodule

