`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2024 12:26:44 PM
// Design Name: 
// Module Name: top
// Project Name: ALU 
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
    parameter NB_DATA = 4,
    parameter NB_BUS = 6
    )
    (
    input button_a,
    input button_b,
    input button_op,
    input [NB_BUS-1:0] i_switch,
    output signed [NB_DATA-1:0] o_data,
    output o_carry,
    output o_zero
    );
    
    reg [NB_DATA-1:0] i_data_a_update, i_data_b_update;
    reg [NB_OP-1:0] i_op_update;
    
    // Hay que usar un solo switch para los valores de entrada, es decir utilizar la misma entrada para los 3 datos
    // Entra al always en bajada y subida (cambios de valor, pasaje de 0 a 1 y 1 a 0)
    
    always @(posedge button_a) begin:i_update_a
        i_data_a_update <= i_switch [NB_DATA-1:0];   
    end
    always @(posedge button_b) begin:i_update_b
        i_data_b_update <= i_switch [NB_DATA-1:0];
    end
    always @(posedge button_op) begin:i_update_op
        i_op_update <= i_switch [NB_OP-1:0];
    end
      
    alu #(
        .NB_OP(NB_OP),
        .NB_DATA(NB_DATA)   
    ) 
    alu_inst (           
        .i_data_a(i_data_a_update),
        .i_data_b(i_data_b_update),
        .i_op(i_op_update),
        .o_data(o_data),
        .o_carry(o_carry),
        .o_zero(o_zero)
    );
    
    
endmodule
