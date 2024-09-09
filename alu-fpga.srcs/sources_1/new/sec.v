`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2024 12:09:57 PM
// Design Name: 
// Module Name: sec
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


module sec #(
    parameter NB_OP = 6,
    parameter NB_DATA = 4
    )
    (
    input i_switch_a,
    input i_switch_b,
    input i_switch_op,
    output [NB_DATA-1:0] o_res
    );
    reg tmp;
    always @(a) begin:update_alu_a
        
    end
    always @(b) begin:update_alu_b
    end
    always @(c) begin:update_alu_op
endmodule
