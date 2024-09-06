`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2024 06:28:03 PM
// Design Name: 
// Module Name: alu
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
//la alu es puramente combinacional, se debe separar la parte combinacional con la secuencial
//la secuencial es la que decide la operacion a realizar
 
module alu#(
    parameter NB_OP = 6,
    parameter NB_DATA = 4
)
(
    input [NB_DATA-1:0] i_data_a,
    input [NB_DATA-1:0] i_data_b,
    input [NB_OP-1:0] i_op,
    output [NB_DATA-1:0] o_data,
    output zero,
    output carry
);
    reg [NB_DATA-1:0] tmp;
    reg tmp_zero;
    reg tmp_carry;
    always @(*) begin:mux_alu
        case(i_op)
            6'b100000: tmp = i_data_a + i_data_b;   // ADD
            6'b100010: begin
                if (i_data_b >= i_data_a) begin 
                    tmp = 4'b0000;
                    tmp_zero = 1'b1;
                    end
                else if (i_data_b < i_data_a) begin
                    tmp = i_data_a - i_data_b;
                    tmp_zero = 1'b0;
                    end
                end // SUB
            6'b100100: tmp = i_data_a & i_data_b;   // AND
            6'b100101: tmp = i_data_a | i_data_b;   // OR
            6'b100110: tmp = i_data_a ^ i_data_b;   // XOR
            default: tmp = 4'b0000;
        endcase
    end
    assign o_data = tmp;
endmodule