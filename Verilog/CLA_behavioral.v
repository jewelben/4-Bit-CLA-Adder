// 4-Bit Carry Look-Ahead Adder
module CLA (
    // Inputs
    input [3:0] a,
    input [3:0] b,
    input Cin,

    //Outputs
    output reg [3:0] sum,
    output reg Cout
    // Cout = carry[3];
    );
    //Intermediates
    reg [3:0] carry;
    //Propagate
    reg [3:0] p;
    //Generate
    reg [3:0] g;
    
    always @(*) begin

        //Generate g_i = a_i AND b_i
        g[0] = a[0] & b[0];
        g[1] = a[1] & b[1];
        g[2] = a[2] & b[2];
        g[3] = a[3] & b[3];

        //Propagate p_i = a_i XOR b_i
        p[0] = a[0] ^ b[0];
        p[1] = a[1] ^ b[1];
        p[2] = a[2] ^ b[2];
        p[3] = a[3] ^ b[3];

        //Carry carry_{i+1} = (p_i AND c_i) OR g_i
        carry[0] = (p[0] & Cin) | g[0];
        carry[1] = (p[1] & carry[0]) | g[1];
        carry[2] = (p[2] & carry[1]) | g[2];
        carry[3] = (p[3] & carry[2]) | g[3]; 

        Cout = carry[3];

        //Sum sum_i = p_i XOR carry_i   
        sum[0] = p[0] ^ Cin;
        sum[1] = p[1] ^ carry[0];
        sum[2] = p[2] ^ carry[1];
        sum[3] = p[3] ^ carry[2];
        
    end
endmodule
