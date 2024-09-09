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


module top_alu_tb;
    // Señales de entrada para el testbench
    reg button_a;
    reg button_b;
    reg button_op;
    reg signed [3:0] i_data_a;
    reg signed [3:0] i_data_b;
    reg [5:0] i_op;

    // Señales de salida desde la ALU
    wire signed [3:0] o_data;
    reg signed [3:0] expected_result;
    integer i;
    // Instanciar el módulo top
    top #(
        .NB_OP(6),
        .NB_DATA(4)
    ) uut (
        .button_a(button_a),
        .button_b(button_b),
        .button_op(button_op),
        .i_data_a(i_data_a),
        .i_data_b(i_data_b),
        .i_op(i_op),
        .o_data(o_data)
    );
    
    // Función para comparar resultados
    task automatic check_result;
        if (o_data !== expected_result) begin
            $display("Error en la operación. i_data_a: %d, i_data_b: %d, i_op: %b, esperado: %d, obtenido: %d", 
                     i_data_a, i_data_b, i_op, expected_result, o_data);
        end else begin
            $display("Test pasado. i_data_a: %d, i_data_b: %d, i_op: %b, resultado: %d", 
                     i_data_a, i_data_b, i_op, o_data);
        end
    endtask

    // Testbench inicial
    initial begin
        for (i = 0; i < 10; i = i + 1) begin 
        
        i_data_a = $random % 16;
        i_data_b = $random % 16;
        case (i)
            0: i_op = 6'b100000;
            1: i_op = 6'b100010;
            2: i_op = 6'b100100;
            3: i_op = 6'b100101;
            4: i_op = 6'b100110;
            5: i_op = 6'b000011;
            6: i_op = 6'b000010;
            7: i_op = 6'b100111;
        endcase
        
        button_op = 1;
        button_a = 1;
        button_b = 1;
        #1
        button_op = 0;
        button_a = 0;
        button_b = 0;
        #1

        case(i_op)
            6'b100000: expected_result = i_data_a + i_data_b; // ADD
            6'b100010: expected_result = i_data_a - i_data_b; // SUB
            6'b100100: expected_result = i_data_a & i_data_b; // AND
            6'b100101: expected_result = i_data_a | i_data_b; // OR
            6'b100110: expected_result = i_data_a ^ i_data_b; // XOR
            6'b000011: expected_result = i_data_a >>> i_data_b; // SRA
            6'b000010: expected_result = i_data_a >> i_data_b;  // SRL
            6'b100111: expected_result = ~(i_data_a | i_data_b); // NOR
            default: expected_result = 4'b0000;
        endcase
        check_result();
            // Esperar 10 unidades de tiempo
        #10;

        // Chequear el resultado
        
        end
        $finish;
        end
    // Monitor para mostrar los resultados
endmodule
