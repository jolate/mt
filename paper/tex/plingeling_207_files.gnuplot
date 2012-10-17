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
set output "plingeling_207_files.eps"
set border
set size square 0.5,0.5 # percent of original (50% of its size here)
unset time # unset for no time
set lmargin 10
set bmargin -1
set rmargin 2
set tmargin 1

# Details for this particular plot
#set key left # legend to the left (bottom is also an option)

set label "in 4 chips" at graph 0.8, graph 0.1 font "Times-Roman,8"
set label "129" at 9.1,85 font "Times-Roman,8"

set label "113" at 1.2,101 font "Times-Roman,8"
set label "121" at 2.2,95.7 font "Times-Roman,8"
set label "119" at 3.2,93.9 font "Times-Roman,8"
set label "122" at 4.2,90.4 font "Times-Roman,8"
set label "124" at 4.7,87.2 font "Times-Roman,8"
set label "124" at 5.7,90.2 font "Times-Roman,8"
set label "127" at 6.7,86.8 font "Times-Roman,8"
set label "124" at 7.7,89 font "Times-Roman,8"
set label "124" at 8.7,89.5 font "Times-Roman,8"
set label "125" at 9.7,89.7 font "Times-Roman,8"
set label "" at 10,85 point pointtype 7 ps 0.5
set label "123 with 40 threads in 4 chips" at 4.5,92.5 font "Times-Roman,8"

set ytics 82,2,102
set yrange [82:102]


unset logscale y  #set for logarithmic scale y (add x for log x)
set xlabel "# of threads" # XAxis title
set ylabel "Total solving time (x10^3 seconds)" # YAxis title
unset key
set border 3 lw 0.5
set xtics nomirror
set ytics nomirror
f(x)=92

plot "plingeling_207_files.dat" using 1:($2/1000) lt 1 pt 7 lw 0.5 ps 0.5 with linespoints, \
f(x) lt 3 lw 0.5 with lines 

#plot "data.txt" using 2:xticlabels(1) title '' with linespoints #labels in 1
