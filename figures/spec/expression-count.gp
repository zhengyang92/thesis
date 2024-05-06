
set fontpath "/usr/share/texmf/fonts/type1/urw/times"
#set terminal postscript enhanced "Times-Roman" 18 fontfile "utmr8a.pfb"
set terminal pdf enhanced size 3.4,2.8 font "Times-Roman,10" lw 1

set style line 2 lc rgb 'black' lt 1 lw 1
set output "expression-count.pdf"
set datafile separator ","
#set boxwidth
#set style data histogram
#set style histogram cluster gap 1
#set style fill solid
set border 3

set style line 1 \
    linecolor rgb '#0060ad' \
    linetype 1 linewidth 3 \
    pointtype 7 pointsize 0.8

#set grid ls 4 #linestyle 4
set tics scale 0

set xtics format ""
#set xtic rotate by -18 scale 0
set grid ytics lt 2 dt 2

#
# Label the axis
#
set xlabel "Depth bound"
set ylabel "Cut count"

set yrange [0:30000]
set xrange [0:7]

#
# Plot the average of the three data points
#   xticlabels: Tells the plot where to find the x-axis labels
#


plot "loop.csv" using 1:3:xticlabels(1) notitle with linespoints ls 1 lc rgb "#475468"