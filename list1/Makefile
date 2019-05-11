all: main prove

main: zadanie1.gpr
	gprbuild -P $<

prove: zadanie1.gpr
	gnatprove -P $< --level=1 --ide-progress-bar

clean: zadanie1.gpr
	gnatprove -P $< --clean
	gprclean  -P $<
