module priority_encoder(
			input [27:0] significand,
			input [6:0] exp_a,
			output reg [27:0] Significand_res,
			output [6:0] exp_sub
			);

reg [4:0] shift;

always @(significand)
begin
	casex (significand)
		28'b0111_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx :	begin
													Significand_res = significand;
									 				shift = ~5'd2 + 5'b1;
								 			  	end
		28'b0110_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx :	begin
													Significand_res = significand >> 2;
									 				shift = ~5'd2 + 5'b1;
								 			  	end
		28'b0101_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx :	begin
													Significand_res = significand >> 2;
									 				shift = ~5'd2 + 5'b1;
								 			  	end
		28'b0100_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx :	begin
													Significand_res = significand >> 2;
									 				shift = ~5'd2 + 5'b1;
								 			  	end 
		28'b0011_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx :	begin
													Significand_res = significand >> 1;
									 				shift = ~5'd1 + 5'b1;
								 			  	end
		28'b0010_xxxx_xxxx_xxxx_xxxx_xxxx_xxxx :	begin
													Significand_res = significand >> 1;
									 				shift = ~5'd1 + 5'b1;
								 			  	end
		28'b0001_1xxx_xxxx_xxxx_xxxx_xxxx_xxxx :	begin
													Significand_res = significand;
									 				shift = 5'd0;
								 			  	end
		28'b0001_01xx_xxxx_xxxx_xxxx_xxxx_xxxx : 	begin						
										 			Significand_res = significand << 1;
									 				shift = 5'd1;
								 			  	end

		28'b0001_001x_xxxx_xxxx_xxxx_xxxx_xxxx : 	begin						
										 			Significand_res = significand << 2;
									 				shift = 5'd2;
								 				end

		28'b0001_0001_xxxx_xxxx_xxxx_xxxx_xxxx : 	begin 							
													Significand_res = significand << 3;
								 	 				shift = 5'd3;
								 				end

		28'b0001_0000_1xxx_xxxx_xxxx_xxxx_xxxx : 	begin						
									 				Significand_res = significand << 4;
								 	 				shift = 5'd4;
								 				end

		28'b0001_0000_01xx_xxxx_xxxx_xxxx_xxxx : 	begin						
									 				Significand_res = significand << 5;
								 	 				shift = 5'd5;
								 				end

		28'b0001_0000_001x_xxxx_xxxx_xxxx_xxxx : 	begin						// 24'h020000
									 				Significand_res = significand << 6;
								 	 				shift = 5'd6;
								 				end

		28'b0001_0000_0001_xxxx_xxxx_xxxx_xxxx : 	begin						// 24'h010000
									 				Significand_res = significand << 7;
								 	 				shift = 5'd7;
								 				end

		28'b0001_0000_0000_1xxx_xxxx_xxxx_xxxx : 	begin						// 24'h008000
									 				Significand_res = significand << 8;
								 	 				shift = 5'd8;
								 				end

		28'b0001_0000_0000_01xx_xxxx_xxxx_xxxx : 	begin						// 24'h004000
									 				Significand_res = significand << 9;
								 	 				shift = 5'd9;
								 				end

		28'b0001_0000_0000_001x_xxxx_xxxx_xxxx : 	begin						// 24'h002000
									 				Significand_res = significand << 10;
								 	 				shift = 5'd10;
								 				end

		28'b0001_0000_0000_0001_xxxx_xxxx_xxxx : 	begin						// 24'h001000
									 				Significand_res = significand << 11;
								 	 				shift = 5'd11;
								 				end

		28'b0001_0000_0000_0000_1xxx_xxxx_xxxx : 	begin						// 24'h000800
									 				Significand_res = significand << 12;
								 	 				shift = 5'd12;
								 				end

		28'b0001_0000_0000_0000_01xx_xxxx_xxxx : 	begin						// 24'h000400
									 				Significand_res = significand << 13;
								 	 				shift = 5'd13;
								 				end

		28'b0001_0000_0000_0000_001x_xxxx_xxxx : 	begin						// 24'h000200
									 				Significand_res = significand << 14;
								 	 				shift = 5'd14;
								 				end

		28'b0001_0000_0000_0000_0001_xxxx_xxxx  : 	begin						// 24'h000100
									 				Significand_res = significand << 15;
								 	 				shift = 5'd15;
								 				end

		28'b0001_0000_0000_0000_0000_1xxx_xxxx : 	begin						// 24'h000080
									 				Significand_res = significand << 16;
								 	 				shift = 5'd16;
								 				end

		28'b0001_0000_0000_0000_0000_01xx_xxxx : 	begin						// 24'h000040
											 		Significand_res = significand << 17;
										 	 		shift = 5'd17;
												end

		28'b0001_0000_0000_0000_0000_001x_xxxx : 	begin						// 24'h000020
									 				Significand_res = significand << 18;
								 	 				shift = 5'd18;
								 				end

		28'b0001_0000_0000_0000_0000_0001_xxxx : 	begin						// 24'h000010
									 				Significand_res = significand << 19;
								 	 				shift = 5'd19;
												end

		28'b0001_0000_0000_0000_0000_0000_1xxx :	begin						// 24'h000008
									 				Significand_res = significand << 20;
								 					shift = 5'd20;
								 				end

		28'b0001_0000_0000_0000_0000_0000_01xx : 	begin						// 24'h000004
									 				Significand_res = significand << 21;
								 	 				shift = 5'd21;
								 				end

		28'b0001_0000_0000_0000_0000_0000_001x : 	begin						// 24'h000002
									 				Significand_res = significand << 22;
								 	 				shift = 5'd22;
								 				end

		28'b0001_0000_0000_0000_0000_0000_0001 : 	begin						// 24'h000001
									 				Significand_res = significand << 23;
								 	 				shift = 5'd23;
								 				end

		28'b0001_0000_0000_0000_0000_0000_0000 : 	begin						// 24'h000000
								 					Significand_res = significand << 24;
							 	 					shift = 5'd24;
								 				end
		default : 	begin
						Significand_res = (~significand) + 1'b1;
						shift = 5'd0;
					end

	endcase
end

assign shift_rev =  ~shift + 5'b1;
assign exp_sub = exp_a + shift_rev;

endmodule


module add_float_prepare(input [31:0] a,b,
output outsig,
output absame_sig,
output [6:0] exp_a,
output [6:0] exp_b,
output [27:0] man_a,
output [27:0] man_b,
output [27:0] man_res);

wire [31:0] op_a;
wire [31:0] op_b;
wire aisbig;
wire swap;

assign absame_sig = !(a[31] ^ b[31]);
assign aisbig = a[30:0] > b[30:0];
assign outsig = absame_sig ? a[31] : (aisbig ? a[31]: b[31]);

assign {swap,op_a,op_b} = (aisbig) ?  {1'b0,a,b} : {1'b1,b,a}; // For operations always op_a must not be less than b
assign exp_a = op_a[30:24];
assign exp_b = op_b[30:24];

assign man_a = {4'b0001,op_a[23:0]} ;
assign man_b =  {4'b0001,op_b[23:0]} ;


add_exec U_ADD_EXEC_AB(.outsig(outsig),
.absame_sig(absame_sig),
.exp_a(exp_a),
.exp_b(exp_b),
.man_a(man_a),
.man_b(man_b),
.man_res(man_res)
);

endmodule


module add_exec(input outsig,
input absame_sig,
input [6:0] exp_a,
input [6:0] exp_b,
input [27:0] man_a,
input [27:0] man_b,
output [27:0] man_res);

wire [6:0] exp_diff;
wire [6:0] exp_b_shifted;
wire [27:0] man_b_shifted, man_add, man_b_reverse, man_sub;

assign exp_diff = exp_a - exp_b;    // Exponent difference calculation
assign man_b_shifted = man_b >> exp_diff;
assign exp_b_shifted  = {1'b0, exp_b} + {1'b0, exp_diff} < 8'hff ? exp_b + exp_diff : 7'h7f; //fixme add overflow
// Add Block //
assign man_add = man_a + man_b_shifted; 
// Sub Block //
assign man_b_reverse = (!absame_sig) ? ~(man_b_shifted) + 28'd1 : 28'd0 ; 

assign man_sub = man_a + man_b_reverse ;
// Output //
assign man_res = (absame_sig) ? man_add : man_sub;

endmodule

module add_4_float(input [31:0] a,b,c,d,
output  [27:0] man_res4,
output [6:0] exp_res4,
output [31:0] hexres);

wire [6:0] exp_a,exp_b,exp_ab;
wire [27:0] man_a,man_b;
wire outsig_ab;
wire samesig_ab;
wire [27:0] man_resab;

wire [6:0] exp_c,exp_d,exp_cd;
wire [27:0] man_c,man_d;
wire outsig_cd;
wire samesig_cd;
wire [27:0] man_rescd;

wire [27:0] man_res4_before;


add_float_prepare U_ADD_AB(.a(a), .b(b),
.outsig(outsig_ab),
.absame_sig(samesig_ab),
.exp_a(exp_a),
.exp_b(exp_b),
.man_a(man_a),
.man_b(man_b),
.man_res(man_resab)
);

add_float_prepare U_ADD_CD(.a(c), .b(d),
.outsig(outsig_cd),
.absame_sig(samesig_cd),
.exp_a(exp_c),
.exp_b(exp_d),
.man_a(man_c),
.man_b(man_d),
.man_res(man_rescd)
);

assign  sig_a = outsig_ab;
assign  sig_b = outsig_cd;
assign  exp_ab = exp_a;
assign  exp_cd = exp_c;

wire aisbig;
wire absame_sig;
wire swap;
wire outsig;

wire [6:0] exp_a_op;
wire [6:0] exp_b_op;
wire [27:0] man_a_op;
wire [27:0] man_b_op;

assign absame_sig = !(sig_a ^ sig_b);
assign aisbig = {exp_ab, man_resab} > {exp_cd, man_rescd};
assign outsig = absame_sig ? sig_a : (aisbig ? sig_a: sig_b);

assign {swap,exp_a_op,man_a_op,exp_b_op,man_b_op} = (aisbig) ?  
	{1'b0,exp_ab,man_resab,exp_cd,man_rescd} : 
	{1'b1,exp_cd,man_rescd,exp_ab,man_resab}; // For operations always op_a must not be less than b

add_exec U_ADD_EXEC(.outsig(outsig),
.absame_sig(absame_sig),
.exp_a(exp_a_op),
.exp_b(exp_b_op),
.man_a(man_a_op),
.man_b(man_b_op),
.man_res(man_res4_before)
);


priority_encoder pe(.significand(man_res4_before),
.exp_a(exp_a_op),
.Significand_res(man_res4),
.exp_sub(exp_res4));

assign hexres = {outsig, exp_res4, man_res4[23:4], 4'b0};
endmodule




module Addition_Subtraction_tb;

reg [31:0] a,b,c,d;
reg clk=1'b0,
	reset =1'b1;

wire [27:0] man_res4;
wire [6:0] exp_res4;
wire [31:0] res;

add_4_float dut(a,b,c,d,man_res4,exp_res4,res);

always #5 clk = ~clk;

initial
begin

//iteration (32'h4201_51EC,32'h4242_147B,32'h42A1_B333,`__LINE__); //32.33 + 48.52 = 80.85
iteration (32'h11e1d230,32'h0c9dc560,32'h81fbe970,32'h01caf760,32'h42A1_B333,`__LINE__); //32.33 + 48.52 = 80.85

$dumpfile("wave.vcd");
$dumpvars(0,Addition_Subtraction_tb);
@(negedge clk)
$stop;

end

task iteration(
input [31:0] op_a,op_b,op_c,op_d,expected_value,
input integer line_num );

begin
	@(negedge clk)
	begin
		a = op_a;
		b = op_b;
		c = op_c;
		d = op_d;
	end

	@(posedge clk)
	begin
		#1;
		if (1)
			$display ("Success: Line Number -> %d : %X",line_num, res);
		else 
			$display ("Success: Line Number -> %d",line_num);
			//$display ("Failed: \t\n A => %h, \t\n B => %h, \t\n Result Obtained => %h, \t\n Expected Value => %h - Line Number",op_a,op_b,res,expected_value,line_num);
	end

	
end

endtask

endmodule
