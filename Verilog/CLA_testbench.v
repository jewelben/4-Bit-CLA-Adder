`timescale 1ns/1ps
module CLA_testbench();
    reg [3:0] a;
    reg [3:0] b;
    reg Cin;

    output [3:0] sum;
    output [3:0] carry;

    CLA abc(.a(a),.b(b),.Cin(Cin),.sum(sum),.carry(carry));

    initial begin

	    $dumpfile("CLA.vcd");
     	$dumpvars(0,CLA_testbench);

        a = 0;
        b = 0;
        Cin = 0;
	    #10 a = 4'd6; b = 4'd2;
	    $monitor( "a = %b, b = %b , Cin = %b , carry[3] = %b, sum = %b",a,b,Cin,carry[3],sum);
        #20 a = 4'd3; b = 4'd10;
        $monitor( "a = %d, b = %d , Cin = %b , carry[3] = %b, sum = %d",a,b,Cin,carry[3],sum);
        #20 a = 4'd11; b = 4'd10; Cin = 1;
        $monitor( "a = %d, b = %d , Cin = %b , carry[3] = %b, sum = %d",a,b,Cin,carry[3],sum);
        #20 a = 4'd0; b = 4'd0; Cin = 0;
        $monitor( "a = %d, b = %d , Cin = %b , carry[3] = %b, sum = %d",a,b,Cin,carry[3],sum);
        #20 a = 4'd9; b = 4'd0; Cin = 1;
        $monitor( "a = %d, b = %d , Cin = %b , carry[3] = %b, sum = %d",a,b,Cin,carry[3],sum);
        #20 a = 4'd15; b = 4'd15; Cin = 1;
        $monitor( "a = %d, b = %d , Cin = %b , carry[3] = %b, sum = %d",a,b,Cin,carry[3],sum);
        #20 a = 4'd6; b = 4'd2; Cin = 0;
        $monitor( "a = %d, b = %d , Cin = %b , carry[3] = %b, sum = %d",a,b,Cin,carry[3],sum);
        #20;
        $finish;

    end
endmodule
