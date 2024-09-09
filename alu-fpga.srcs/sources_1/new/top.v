`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2024 12:26:44 PM
// Design Name: 
// Module Name: top
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


module top #(
    parameter NB_OP = 6,
    parameter NB_DATA = 4
    )
    (
    input button_a,
    input button_b,
    input button_op,
    input signed [NB_DATA-1:0] i_data_a,
    input signed [NB_DATA-1:0] i_data_b,
    input [NB_OP-1:0] i_op,
    output signed [NB_DATA-1:0] o_data
    );
    
    reg [NB_DATA-1:0] i_data_a_update, i_data_b_update;
    reg [NB_OP-1:0] i_op_update;
    
    always @(button_a) begin:i_update_a
        i_data_a_update <= i_data_a;   
    end
    always @(button_b) begin:i_update_b
        i_data_b_update <= i_data_b;
    end
    always @(button_op) begin:i_update_op
        i_op_update <= i_op;
    end
      
    alu #(
        .NB_OP(NB_OP),         // Parámetro NB_OP
        .NB_DATA(NB_DATA)        // Parámetro NB_DATA
    ) 
    alu_inst (                // "uut" es la unidad bajo prueba (Unit Under Test)
        .i_data_a(i_data_a_update),
        .i_data_b(i_data_b_update),
        .i_op(i_op_update),
        .o_data(o_data)
    );
    
    
endmodule
