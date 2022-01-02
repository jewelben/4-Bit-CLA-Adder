// 4-Bit Carry Look-Ahead Adder with D Flip-Flops
module CLA_clked (
    // Inputs
    input CLK,
    input [3:0] a,
    input [3:0] b,
    input Cin,

    //Outputs
    output reg [3:0] sum,
    output reg Cout
    // Cout = carry[3];
    );

    //Intermediates
    reg [3:0] Q_a;
    reg [3:0] Q_b;
    wire [3:0] D_sum;
    wire D_Cout;

    always @(posedge CLK)
    begin
        //Input D flip-flops
        Q_a = a;
        Q_b = b;
    end

    //CLA
    CLA abc(.a(Q_a),.b(Q_b),.Cin(Cin),.sum(D_sum),.Cout(D_Cout));

    always @(posedge CLK)
    begin
        //Output D flip-flops
        sum = D_sum;
        Cout = D_Cout;
    end
endmodule
