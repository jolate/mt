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
set output "shared-all-start.eps"
set border
set size square 0.5,0.5 # percent of original (50% of its size here)
unset time # unset for no time

# Details for this particular plot
set key left # legend to the left (bottom is also an option)
unset logscale y  #set for logarithmic scale y (add x for log x)
set xlabel "# of threads" # XAxis title
set ylabel "LLC miss %" # YAxis title
set key below
set xtics nomirror
set ytics nomirror
plot "shared-all-start.dat" using 1:2 lt 2 lw 0.5 ps 0.5 title '{/Times=6  goldb-heqc-alu4mul}' with linespoints, \
"shared-all-start.dat" using 1:3 lt 2 lw 0.5 ps 0.5 title '{/Times=6  goldb-heqc-i8mul}' with linespoints, \
"shared-all-start.dat" using 1:4 lt 2 lw 0.5 ps 0.5 title '{/Times=6  ibm-2002-31_1r3-k30}' with linespoints, \
"shared-all-start.dat" using 1:5 lt 2 lw 0.5 ps 0.5 title '{/Times=6  ibm-2004-23-k80}' with linespoints, \
"shared-all-start.dat" using 1:6 lt 2 lw 0.5 ps 0.5 title '{/Times=6 manol-pipe-g10bid_i}' with linespoints, \
"shared-all-start.dat" using 1:7 lt 2 lw 0.5 ps 0.5 title '{/Times=6 post-c32s-gcdm16-22}' with linespoints, \
"shared-all-start.dat" using 1:8 lt 2 lw 0.5 ps 0.5 title '{/Times=6 schup-l2s-motst-2-k315}' with linespoints, \
"shared-all-start.dat" using 1:9 lt 2 lw 0.5 ps 0.5 title '{/Times=6 simon-s02-f2clk-50}' with linespoints

#plot "data.txt" using 2:xticlabels(1) title '' with linespoints #labels in 1
