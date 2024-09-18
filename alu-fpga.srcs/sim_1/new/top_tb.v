//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2024 12:56:00 PM
// Design Name: 
// Module Name: top_alu_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_tb;
    
    reg button_a;
    reg button_b;
    reg button_op;
    reg [5:0] i_switch;
    reg clock;
    
    reg [3:0] data_a, data_b;
    reg [5:0] data_op;
    
    wire signed [3:0] o_data;
    wire o_carry;
    wire o_zero;
    
    // Register for result test
    reg signed [3:0] expected_result;
    
    // for variable
    integer i;
    
    // Instance top 
    top #(
        .NB_OP(6),
        .NB_DATA(4),
        .NB_BUS(6)
    ) uut (
        .button_a(button_a),
        .button_b(button_b),
        .button_op(button_op),
        .i_switch(i_switch),
        .clock(clock),
        .o_data(o_data),
        .o_carry(o_carry),
        .o_zero(o_zero)
    );
    
    // Compare results
    task automatic check_result;
        if (o_data !== expected_result) begin
            $display("Operation Error. data_a: %d, data_b: %d, data_op: %b, expected: %d, obtain: %d", 
                     data_a, data_b, data_op, expected_result, o_data);
        end else begin
            $display("Passed Test. data_a: %d, data_b: %d, data_op: %b, obtain: %d", 
                     data_a, data_b, data_op, o_data);
        end
    endtask

    // Testbench init
    initial begin
        button_a = {4{1'b0}};
        button_b = {4{1'b0}};
        button_op = {6{1'b0}};
        clock = 1'b0;
        
        for (i = 0; i < 10; i = i + 1) begin 
       
        
        i_switch = $random % 64;
        data_a = i_switch [3:0];
        button_a = 1'b1;
        clock = 1'b1;
        #1
        button_a = 1'b0;
        clock = 1'b0;
        #1
        
        i_switch = $random % 64;
        data_b = i_switch [3:0];
        button_b = 1'b1;
        clock = 1'b1;
        #1
        button_b = 1'b0;
        clock = 1'b0;
        #1
        
        case (i)
            0: i_switch = 6'b100000;
            1: i_switch = 6'b100010;
            2: i_switch = 6'b100100;
            3: i_switch = 6'b100101;
            4: i_switch = 6'b100110;
            5: i_switch = 6'b000011;
            6: i_switch = 6'b000010;
            7: i_switch = 6'b100111;
        endcase
        data_op = i_switch [5:0];
        button_op = 1'b1;
        clock = 1'b1;
        #1
        button_op = 1'b0;
        clock = 1'b0;
        #1

        case(i_switch[5:0])
            6'b100000: expected_result = data_a + data_b; // ADD
            6'b100010: expected_result = data_a - data_b; // SUB
            6'b100100: expected_result = data_a & data_b; // AND
            6'b100101: expected_result = data_a | data_b; // OR
            6'b100110: expected_result = data_a ^ data_b; // XOR
            6'b000011: expected_result = data_a >>> data_b; // SRA
            6'b000010: expected_result = data_a >> data_b;  // SRL
            6'b100111: expected_result = ~(data_a | data_b); // NOR
            default: expected_result = {4{1'b0}};
        endcase
        check_result();
        #10;        
        end
        $finish;
        end
endmodule
