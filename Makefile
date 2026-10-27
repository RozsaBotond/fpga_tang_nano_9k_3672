# Requires oss-cad-suite on PATH (see README)
TOP    = top
DEVICE = GW1NR-LV9QN88PC6/I5
FAMILY = GW1N-9C
BOARD  = tangnano9k

all: fpga.fs

fpga.json: led.v
	yosys -p "read_verilog led.v; synth_gowin -top $(TOP) -json $@"

fpga_pnr.json: fpga.json conf.cst
	nextpnr-gowin --json $< --write $@ --freq 27 --device $(DEVICE) --family $(FAMILY) --cst conf.cst

fpga.fs: fpga_pnr.json
	gowin_pack -d $(FAMILY) -o $@ $<

load: fpga.fs
	openFPGALoader -b $(BOARD) $<

flash: fpga.fs
	openFPGALoader -b $(BOARD) -f $<

clean:
	rm -f fpga.json fpga_pnr.json fpga.fs *.dbgmodule

.PHONY: all load flash clean
