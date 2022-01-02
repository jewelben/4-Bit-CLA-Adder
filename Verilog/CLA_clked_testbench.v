`timescale 1ns/1ps
module CLA_clked_testbench();

    reg CLK;
    reg [3:0] a;
    reg [3:0] b;
    reg Cin;
    output [3:0] sum;
    output Cout;

    CLA_clked abc(.CLK(CLK),.a(a),.b(b),.Cin(Cin),.sum(sum),.Cout(Cout));

    initial begin
	    $dumpfile("CLA_clked.vcd");
     	$dumpvars(0,CLA_clked_testbench);
        a = 0;
        b = 0;
        Cin = 0;
        CLK = 0;
	    #10 a = 4'd3; b = 4'd2; Cin = 1;
	    $monitor( "a = %b, b = %b , Cin = %b , Cout = %b, sum = %b",a,b,Cin,Cout,sum);
        #20 a = 4'd15; b = 4'd15; Cin = 1;
        $monitor( "a = %b, b = %b , Cin = %b , Cout = %b, sum = %b",a,b,Cin,Cout,sum);
        #20 a = 4'd5; b = 4'd5; Cin = 0;
        $monitor( "a = %b, b = %b , Cin = %b , Cout = %b, sum = %b",a,b,Cin,Cout,sum);
        #20 a = 4'd15; b = 4'd1; Cin = 1;
        $monitor( "a = %b, b = %b , Cin = %b , Cout = %b, sum = %b",a,b,Cin,Cout,sum);
        #20
        $finish;
    end

    always #10 CLK = ~CLK;
        
endmodule
