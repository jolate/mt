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
set output "SBSS.eps"
set border
set size square 0.5,0.5 # percent of original (50% of its size here)
unset time # unset for no time
set lmargin 10
set bmargin -1
set rmargin 2
set tmargin 1
set bars 1

# Details for this particular plot
set key left # legend to the left (bottom is also an option)
unset logscale y  #set for logarithmic scale y (add x for log x)
set xlabel "# of threads" # XAxis title
set ylabel "LLC misses %" # YAxis title
set key at 0,-13
set key spacing 0.6
set border 3 lw 0.5
set xtics nomirror
set ytics nomirror
#set ytics 0,10,90
#set yrange [0:90]
set title "Shared-Binaries-Same-Search Cache Miss %"

plot "SBSS.dat" using 1:2:($2*($3/100)) lt 1 lw 0.5 pt 7 ps 0.3 title '{/Times=6 manol-pipe-c10b}' with yerrorlines, \
"SBSS.dat" using 1:4:($4*($5/100)) lt 2 lw 0.5 pt 7 ps 0.3 title '{/Times=6 manol-pipe-c6bid_i}' with yerrorlines, \
"SBSS.dat" using 1:6:($6*($7/100)) lt 3 lw 0.5 pt 7 ps 0.3 title '{/Times=6 manol-pipe-c6nidw_i}' with yerrorlines, \
"SBSS.dat" using 1:8:($8*($9/100)) lt 4 lw 0.5 pt 7 ps 0.3 title '{/Times=6 manol-pipe-c7idw}' with yerrorlines, \
"SBSS.dat" using 1:10:($10*($11/100)) lt 5 lw 0.5 pt 7 ps 0.3 title '{/Times=6 manol-pipe-cha05-113}' with yerrorlines, \
"SBSS.dat" using 1:12:($12*($13/100)) lt 6 lw 0.5 pt 7 ps 0.3 title '{/Times=6 anbul-dated-5-15-u}' with yerrorlines, \
"SBSS.dat" using 1:14:($14*($15/100)) lt 7 lw 0.5 pt 7 ps 0.3 title '{/Times=6 ibm-2002-31_1r3-k30}' with yerrorlines, \
"SBSS.dat" using 1:16:($16*($17/100)) lt 8 lw 0.5 pt 7 ps 0.3 title '{/Times=6 post-c32s-gcdm16-22}' with yerrorlines

#plot "data.txt" using 2:xticlabels(1) title '' with linespoints #labels in 1
