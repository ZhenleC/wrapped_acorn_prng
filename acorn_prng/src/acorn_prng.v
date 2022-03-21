////////////////////////////////////////////////////////////////////////////////////////////
// ACORN (Additive Congruential Random Number) generator, a pseudo random number generator
// Inspired from this page: http://acorn.wikramaratna.org/ 
// Made by Zhenle Cao for the ZerotoASIC course
// Huge shoutout and appreciation to Steven Goldsmith for his invaluable assistance.
// March 2022, to be taped out on MPW5
// 16th order ACORN with modulus = 2^16, and easily scalable to higher modulos.
////////////////////////////////////////////////////////////////////////////////////////////

`default_nettype none
`timescale 1ns/1ps

module acorn_prng (

`ifdef USE_POWER_PINS
	inout vccd1,	// User area 1 1.8V power
	inout vssd1,	// User area 1 digital ground
`endif

    input clk,
    input reset,
    input wire load,
    input wire [1:0] select,
    input wire [11:0] gpio_seed,
    input wire [11:0] LA1_seed,
    output reg [11:0] out,
    output [12:0] io_oeb,
    output wire reset_out
);

assign io_oeb = 13'b0;

assign reset_out = reset;

reg [11:0] seed;

reg [11:0] r01;
reg [11:0] r02;
reg [11:0] r03;
reg [11:0] r04;
reg [11:0] r05;
reg [11:0] r06;
reg [11:0] r07;
reg [11:0] r08;
reg [11:0] r09;
reg [11:0] r010;
reg [11:0] r011;
reg [11:0] r012;
reg [11:0] r013;
reg [11:0] r014;
reg [11:0] r015;

reg [11:0] r10;
reg [11:0] r11;
reg [11:0] r12;
reg [11:0] r13;
reg [11:0] r14;
reg [11:0] r15;
reg [11:0] r16;
reg [11:0] r17;
reg [11:0] r18;
reg [11:0] r19;
reg [11:0] r110;
reg [11:0] r111;
reg [11:0] r112;
reg [11:0] r113;
reg [11:0] r114;
reg [11:0] r115;


reg [3:0] counter;



always @(posedge clk) begin


	if (reset) begin 

//everything to zero 

		counter <= 0;
		r01 <= 0;
		r02 <= 0;
		r03 <= 0;
		r04 <= 0;
		r05 <= 0;
		r06 <= 0;
		r07 <= 0;
		r08 <= 0;
		r09 <= 0;
		r010 <= 0;
		r011 <= 0;
		r012 <= 0;
		r013 <= 0;
		r014 <= 0;
		r015 <= 0;

		r11 <= 0;
		r12 <= 0;
		r13 <= 0;
		r14 <= 0;
		r15 <= 0;
		r16 <= 0;
		r17 <= 0;
		r18 <= 0;
		r19 <= 0;
		r110 <= 0;
		r111 <= 0;
		r112 <= 0;
		r113 <= 0;
		r114 <= 0;
		r115 <= 0;

		out <= 0;
		seed <= 0;
		

	end else 
	
	if (load) begin
	
	if(select == 2'b00)
	seed <= 12'b100000000001;
	
	if(select == 2'b11)
	seed <= 12'b111111111111;
	
	if(select == 2'b01)
	seed <= gpio_seed;
	
	if(select == 2'b10)
	seed <= LA1_seed;
	
	
	end else begin

	counter <= counter + 1;
	
	if(counter == 0)

	r11 <= r01+seed;
	
	if(counter == 1)

	r12 <= r02+r11;

	if(counter == 2)

	r13 <= r03+r12;

	if(counter == 3)
	r14 <= r04+r13;

	if(counter == 4)
	r15 <= r05+r14;

	if(counter == 5)
	r16 <= r06+r15;

	if(counter == 6)
	r17 <= r07+r16;

	if(counter == 7)
	r18 <= r08+r17;

	if(counter == 8)
	r19 <= r09+r18;

	if(counter == 9)
	r110 <= r010+r19;

	if(counter == 10)
	r111 <= r011+r110;

	if(counter == 11)
	r112 <= r012+r111;

	if(counter == 12)
	r113 <= r013+r112;

	if(counter == 13)
	r114 <= r014+r113;

	if(counter == 14)
	r115 <= r015+r114;

	if(counter == 15)

		out <= r115;

		r01 <= r11;
		r02 <= r12;
		r03 <= r13;
		r04 <= r14;
		r05 <= r15;
		r06 <= r16;
		r07 <= r17;
		r08 <= r18;
		r09 <= r19;
		r010 <= r110;
		r011 <= r111;
		r012 <= r112;
		r013 <= r113;
		r014 <= r114;
		r015 <= r115;
		


	end
end


endmodule
