
set fontpath "/usr/share/texmf/fonts/type1/urw/times"
#set terminal postscript enhanced "Times-Roman" 18 fontfile "utmr8a.pfb"
set terminal pdf enhanced size 3.4,2.0 font "Times-Roman,8" lw 1

set style line 2 lc rgb 'black' lt 1 lw 1
set output "spec-intel.pdf"
set datafile separator ","
set boxwidth
set style data histogram
set style histogram cluster gap 1
set style fill solid
set border 3

#set grid ls 4 #linestyle 4
set tics scale 0

set xtics format ""
set xtic rotate by -18 scale 0
set grid ytics lt 2 dt 2

#
# Label the axis
#
set xlabel "Benchmarks" font "Times-Roman,8"
set ylabel "Speedup" font "Times-Roman,8"

set yrange [0.995:1.05]


#
# Set the range of the y axis
#
#set yrange [0:550]
#set xrange [0:1000]

#
# Plot the average of the three data points
#   xticlabels: Tells the plot where to find the x-axis labels
#

# with errorbar
plot "cpu17.intel.csv" using 4:xtic(1) notitle ls 2 lc rgb "#475468",\
     "" using 0:($4 + 0.0017):5 with labels notitle
