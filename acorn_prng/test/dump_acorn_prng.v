module dump();
    initial begin
        $dumpfile ("acorn_prng.vcd");
        $dumpvars (0, acorn_prng);
        #1;
    end
endmodule
