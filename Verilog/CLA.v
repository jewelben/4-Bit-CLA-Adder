// 4-Bit Carry Look-Ahead Adder
module CLA (a,b,Cin,sum,carry);

    // Inputs
    input [3:0] a;
    input [3:0] b;
    input Cin;

    //Outputs
    output [3:0] sum;
    output [3:0] carry;

    //Intermediates
    //Propagate
    wire [3:0] p;
    //Generate
    wire [3:0] g;
    wire w1,w2,w3,w4;

    //Generate g_i = a_i AND b_i
    and GEN0(g[0],a[0],b[0]); 
    and GEN1(g[1],a[1],b[1]);
    and GEN2(g[2],a[2],b[2]); 
    and GEN3(g[3],a[3],b[3]);

    //Propagate p_i = a_i XOR b_i
    xor PROP0(p[0],a[0],b[0]);
    xor PROP1(p[1],a[1],b[1]);
    xor PROP2(p[2],a[2],b[2]);
    xor PROP3(p[3],a[3],b[3]);

    //Carry carry_{i+1} = (p_i AND c_i) OR g_i
    and AND0(w0,p[0],Cin);
    or OR0(carry[0],w0,g[0]);

    and AND11(w11,p[1],p[0],Cin);
    and AND12(w12,p[1],g[0]);
    or OR1(carry[1],w11,w12,g[1]);
    //and AND1(w2,p[1],carry[0]);
    //or OR1(carry[1],w2,g[1]);

    and AND21(w21,p[2],p[1],p[0],Cin);
    and AND22(w22,p[2],p[1],g[0]);
    and AND23(w23,p[2],g[1]);
    or OR2(carry[2],w21,w22,w23,g[2]);
    //and AND2(w3,p[2],carry[1]);
    //or OR2(carry[2],w3,g[2]);

    and AND31(w31,p[3],p[2],p[1],p[0],Cin);
    and AND32(w32,p[3],p[2],p[1],g[0]);
    and AND33(w33,p[3],p[2],g[1]);
    and AND34(w34,p[3],g[2]);
    or OR3(carry[3],w31,w32,w33,w34,g[3]);
    //and AND3(w4,p[3],carry[2]);
    //or OR3(Cout,w4,g[3]);

    //Sum sum_i = p_i XOR carry_i   
    xor SUM0(sum[0],p[0],Cin);
    xor SUM1(sum[1],p[1],carry[0]);
    xor SUM2(sum[2],p[2],carry[1]);
    xor SUM3(sum[3],p[3],carry[2]);

endmodule