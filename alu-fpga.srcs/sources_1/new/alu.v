//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2024 06:28:03 PM
// Design Name: 
// Module Name: alu
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
 
module alu#(
    parameter NB_OP = 6,
    parameter NB_DATA = 4
)
(
    input signed [NB_DATA-1:0] i_data_a,
    input signed [NB_DATA-1:0] i_data_b,
    input [NB_OP-1:0] i_op,
    output signed [NB_DATA-1:0] o_data,
    output o_carry,
    output o_zero
);
   
    reg signed [NB_DATA-1:0] tmp;
    reg carry_tmp = 1'b0;
    reg zero_tmp = 1'b0;
    
    always @(*) begin:mux_alu       
        case(i_op)
            6'b100000: {carry_tmp, tmp} = i_data_a + i_data_b;   // ADD
            6'b100010: begin
                tmp = i_data_a - i_data_b;
                if (tmp == 0)
                    zero_tmp = 1'b1;
                else
                    zero_tmp = 1'b0;
                end                                      // SUB
            6'b100100: tmp = i_data_a & i_data_b;   // AND
            6'b100101: tmp = i_data_a | i_data_b;   // OR
            6'b100110: tmp = i_data_a ^ i_data_b;   // XOR
            6'b000011: tmp = i_data_a >>> i_data_b;  // SRA
            6'b000010: tmp = i_data_a >> i_data_b;  // SRL
            6'b100111: tmp = ~(i_data_a | i_data_b);//NOR
            default: tmp = {NB_DATA{1'b0}};
        endcase
    end
    assign o_data = tmp;
    assign o_carry = carry_tmp;
    assign o_zero = zero_tmp;
    
endmodule