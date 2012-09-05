# Gnuplot Script
# To generate: C-x p
################################################################################
# This program by L A Ferres is in the public domain and freely copyable.
# (or, if there were problems, in the errata  --- see
#    http://www.udec.cl/~leo/programs.html)
# If you find any bugs, please report them immediately to: leo@inf.udec.cl
################################################################################
#
# FILE NAME: plingeling_same_chip.gnuplot
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
set output "long_experiment.eps"
set border
set size square 0.5,0.5 # percent of original (50% of its size here)
unset time # unset for no time
set lmargin 8
set bmargin 0
set rmargin 2
set tmargin 1

# Details for this particular plot
#set key left # legend to the left (bottom is also an option)
unset logscale y  #set for logarithmic scale y (add x for log x)
set xlabel "# of threads" # XAxis title
set ylabel "Total runtime (ks)" # YAxis title
#set key at -0.0,-10.85
#set key top
#set key outside bot center
#set key spacing 1.2
#set key autotitle columnhead
unset key
set border 3 lw 0.5
set xtics nomirror
set ytics nomirror
set xtics 0,1,10
set yrange [85:105]
#set ytics -2,2,18
plot "long_experiment.dat" using 1:2 lt 1 pt 7 ps 0.5 with linespoints

#plot "data.txt" using 2:xticlabels(1) title '' with linespoints #labels in 1
