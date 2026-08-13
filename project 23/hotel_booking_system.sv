module hotel_booking_system #(
    parameter NUM_ROOMS = 8
)(
    input  logic       clk,
    input  logic       reset_n,

    input  logic       book,
    input  logic       cancel,
    input  logic [2:0] room_id,

    output logic       booking_success,
    output logic       cancellation_success,
    output logic       room_booked,
    output logic [3:0] available_rooms
);

    // 1 = booked, 0 = available
    logic [NUM_ROOMS-1:0] room_status;

    integer i;

    always_ff @(posedge clk or negedge reset_n) begin

        if (!reset_n) begin

            room_status            <= '0;
            booking_success        <= 1'b0;
            cancellation_success   <= 1'b0;
            available_rooms        <= NUM_ROOMS;
            room_booked            <= 1'b0;

        end
        else begin

            // Default success signals
            booking_success      <= 1'b0;
            cancellation_success <= 1'b0;

            // Current room status
            room_booked <= room_status[room_id];

            // BOOK operation
            if (book && !cancel) begin

                if (room_status[room_id] == 1'b0) begin

                    room_status[room_id] <= 1'b1;
                    booking_success      <= 1'b1;

                    if (available_rooms > 0)
                        available_rooms <= available_rooms - 1'b1;

                end

            end

            // CANCEL operation
            else if (cancel && !book) begin

                if (room_status[room_id] == 1'b1) begin

                    room_status[room_id] <= 1'b0;
                    cancellation_success <= 1'b1;

                    if (available_rooms < NUM_ROOMS)
                        available_rooms <= available_rooms + 1'b1;

                end

            end

        end

    end

endmodule
