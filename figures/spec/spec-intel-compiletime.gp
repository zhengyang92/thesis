
set fontpath "/usr/share/texmf/fonts/type1/urw/times"
#set terminal postscript enhanced "Times-Roman" 18 fontfile "utmr8a.pfb"
set terminal pdf enhanced size 3.4,2.0 font "Times-Roman,8" lw 1

set style line 2 lc rgb 'black' lt 1 lw 1
set output "spec-intel-compiletime.pdf"
set datafile separator ","
set boxwidth 0.9
set style data histogram
set style histogram cluster gap 1
set style fill solid
set border 3
#set key off

#set grid ls 4 #linestyle 4
set tics scale 0

set xtics format ""
set xtic rotate by -18 scale 0
set grid ytics lt 2 dt 2

#
# Label the axis
#
set xlabel "Benchmarks" font "Times-Roman,8"
set ylabel "Compilation Time (s)" font "Times-Roman,8"

# set label "2.14" at 4.58,7 font "Times-Roman,3"
# set label "2.10" at 4.92,7 font "Times-Roman,3"
# set label "1.13" at 5.25,7 font "Times-Roman,3"

set yrange [0:25000]


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
plot  '< sort cpu17.intel.csv' \
   using 7:xtic(1) ls 2 lc rgb "#475468" title "cold cache", \
'' using 0:7:7 with labels font "Times-Roman,8" textcolor rgb "#475468" offset -1.8,0.5 notitle, \
'' using 8 ls 2 lc rgb "#ed7d31" title "warm cache",  \
'' using 0:8:8 with labels font "Times-Roman,8" textcolor rgb "#ed7d31" offset 0.3,0.5 notitle, \
'' using 6 ls 2 lc rgb "#548235" title "clang",  \
'' using 0:6:6 with labels font "Times-Roman,8" textcolor rgb "#548235" offset 2.6,0.5 notitle, \