`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2024 11:35:56 AM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb;

    // Declarar las señales de entrada y salida
    reg signed [3:0] i_data_a;
    reg signed [3:0] i_data_b;
    reg signed [5:0] i_op;
    wire signed [3:0] o_data;

    // Instanciar el módulo ALU con parámetros
    alu #(
        .NB_OP(6),         // Parámetro NB_OP
        .NB_DATA(4)        // Parámetro NB_DATA
    ) uut (                // "uut" es la unidad bajo prueba (Unit Under Test)
        .i_data_a(i_data_a),
        .i_data_b(i_data_b),
        .i_op(i_op),
        .o_data(o_data)
    );

    // Estímulos de prueba
    initial begin
        // Establecer valores para las señales de entrada
        
//        i_data_a = 2;
//        i_data_b = 3;
//        i_op = 6'b100000;    // ADD
//        #10;
        
        i_data_a = -3;
        i_data_b = 6;
        i_op = 6'b100010;    // SUB
        #10;
        
//        i_data_a = 4'b0001;
//        i_data_b = 4'b0010;
//        i_op = 6'b100100;    // AND
//        #10;
        
//        i_data_a = 4'b0001;
//        i_data_b = 4'b0010;
//        i_op = 6'b100101;    // OR
//        #10;
        
//        i_data_a = 4'b0001;
//        i_data_b = 4'b0010;
//        i_op = 6'b100110;    // XOR
//        #10;
        
//        i_data_a = 240;
//        i_data_b = 3;
//        i_op = 6'b000011;    // SRA
//        #10;
        
//        i_data_a = 240;
//        i_data_b = 3;
//        i_op = 6'b000010;    // SLA
//        #10;
        $finish;           // Finish Sim
    end

endmodule
