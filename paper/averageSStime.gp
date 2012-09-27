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
set output "averageSStime.eps"
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
set ylabel "Time Decay %" # YAxis title
set key at -2.5,-25
set key spacing 0.6
set border 3 lw 0.5
set xtics nomirror
set ytics nomirror
set ytics 0,10,60
set yrange [0:60]
set title "Same Search Time Decay Averages"

plot "SASStime.dat" using 1:((((($2/89.2)*100)-100)+((($4/275.7)*100)-100)+((($6/324.5)*100)-100)+((($8/78.2)*100)-100)+((($10/64.5)*100)-100)+((($12/1142.8)*100)-100)+((($14/1624.4)*100)-100)+((($16/1004.2)*100)-100))/8) lt 1 lw 0.5 pt 7 ps 0.3 title '{/Times=6 AzuDICI-Shared-All-Same-Search Average}' with linespoint, \
"SNSStime.dat" using 1:((((($2/82.6)*100)-100)+((($4/255.0)*100)-100)+((($6/298.9)*100)-100)+((($8/70.9)*100)-100)+((($10/60.2)*100)-100)+((($12/1146.8)*100)-100)+((($14/1569.5)*100)-100)+((($16/966.9)*100)-100))/8) lt 2 lw 0.5 pt 5 ps 0.3 title '{/Times=6 AzuDICI-Shared-None-Same-Search Average}' with linespoint, \
"SBSStime.dat" using 1:((((($2/84.4)*100)-100)+((($4/262.4)*100)-100)+((($6/307.8)*100)-100)+((($8/75.1)*100)-100)+((($10/61.0)*100)-100)+((($12/1175.2)*100)-100)+((($14/1581.1)*100)-100)+((($16/973)*100)-100))/8) lt 3 lw 0.5 pt 9 ps 0.3 title '{/Times=6 AzuDICI-Shared-Binaries-Same-Search Average}' with linespoint


#plot "data.txt" using 2:xticlabels(1) title '' with linespoints #labels in 1