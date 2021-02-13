ulx3s.bit: ulx3s_out.config
	ecppack ulx3s_out.config ulx3s.bit

ulx3s_out.config: passthru.json
	nextpnr-ecp5 --85k --json passthru.json \
		--lpf ulx3s_v20.lpf \
		--textcfg ulx3s_out.config 

passthru.json: passthru.ys passthru.v
	yosys passthru.ys 

prog: ulx3s.bit
	fujprog ulx3s.bit
