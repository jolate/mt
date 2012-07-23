# Gnuplot Script
# To generate: C-x p
################################################################################
# This program by L A Ferres is in the public domain and freely copyable.
# (or, if there were problems, in the errata  --- see
#    http://www.udec.cl/~leo/programs.html)
# If you find any bugs, please report them immediately to: leo@inf.udec.cl
################################################################################
#
# FILE NAME: plingeling_6cores.gnuplot
#
# PURPOSE:
#
# FILE(S) GENERATING THIS DATA:
#
# CREATION DATE: 2012-02-02-13:36; MODIFIED:
#
################################################################################
#
# General options for Azu graphs
# They are inserted in Latex files in a picture environment
#
set terminal postscript portrait "Times-Roman" 10
set terminal postscript enhanced
set output "average.eps"
set border
set size square 0.5,0.5 # percent of original (50% of its size here)
unset time # unset for no time

# Details for this particular plot
set key left # legend to the left (bottom is also an option)
unset logscale y  #set for logarithmic scale y (add x for log x)
set xlabel "# of threads" # XAxis title
set ylabel "LLC miss %" # YAxis title
set key right bottom
set xtics nomirror
set ytics nomirror
plot "average.dat" using 1:2 lt 2 lw 0.5 ps 0.5 title '{/Times=6  SharedNone}' with linespoints, \
"average.dat" using 1:3 lt 2 lw 0.5 ps 0.5 title '{/Times=6  SharedAll}' with linespoints, \
"average.dat" using 1:4 lt 2 lw 0.5 ps 0.5 title '{/Times=6  SharedBinaries}' with linespoints, \
"average.dat" using 1:5 lt 2 lw 0.5 ps 0.5 title '{/Times=6  SharedAllLimited}' with linespoints

#plot "data.txt" using 2:xticlabels(1) title '' with linespoints #labels in 1
