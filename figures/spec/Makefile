SRCS := $(wildcard *.tex)
SVGS := $(wildcard *.svg)

all : spec-amd.pdf spec-intel.pdf spec-intel-compiletime.pdf spec-amd-compiletime.pdf compilation-time.pdf optimization-count.pdf expression-count.pdf

spec-amd.pdf : spec-amd.gp cpu17.amd.csv
	gnuplot spec-amd.gp

spec-intel.pdf : spec-intel.gp cpu17.intel.csv
	gnuplot spec-intel.gp

spec-intel-compiletime.pdf : spec-intel-compiletime.gp cpu17.intel.csv
	gnuplot spec-intel-compiletime.gp

spec-amd-compiletime.pdf : spec-amd-compiletime.gp cpu17.amd.csv
	gnuplot spec-amd-compiletime.gp




compilation-time.pdf : compilation-time.gp loop.csv
	gnuplot compilation-time.gp

expression-count.pdf : expression-count.gp loop.csv
	gnuplot expression-count.gp

optimization-count.pdf : optimization-count.gp loop.csv
	gnuplot optimization-count.gp



