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
set output "averageSS.eps"
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
set ylabel "LLC miss %" # YAxis title
set key at -2.5,-5
set key spacing 0.6
set border 3 lw 0.5
set xtics nomirror
set ytics nomirror
set title "Same Search Cache Miss % Averages"

plot "SASS.dat" using 1:(($2+$4+$6+$8+$10+$12+$14+$16)/8) lt 1 lw 0.5 pt 7 ps 0.3 title '{/Times=6 AzuDICI-Shared-All-Same-Search Average}' with linespoint, \
"SNSS.dat" using 1:(($2+$4+$6+$8+$10+$12+$14+$16)/8) lt 2 lw 0.5 pt 5 ps 0.3 title '{/Times=6 AzuDICI-Shared-None-Same-Search Average}' with linespoint, \
"SBSS.dat" using 1:(($2+$4+$6+$8+$10+$12+$14+$16)/8) lt 3 lw 0.5 pt 9 ps 0.3 title '{/Times=6 AzuDICI-Shared-Binaries-Same-Search Average}' with linespoint


#plot "SADS.dat" using 1:2:($2*($3/100)) lt 1 lw 0.5 pt 7 ps 0.3 title '{/Times=6 aaai10-planning-ipc5-pathways-13-step17}' with yerrorlines, \
#"SADS.dat" using 1:4:($4*($5/100)) lt 2 lw 0.5 pt 7 ps 0.3 title '{/Times=6 E02F22}' with yerrorlines, \
#"SADS.dat" using 1:6:($6*($7/100)) lt 3 lw 0.5 pt 7 ps 0.3 title '{/Times=6 grid-strips-grid-y-3.035-NOTKNOWN}' with yerrorlines, \
#"SADS.dat" using 1:8:($8*($9/100)) lt 4 lw 0.5 pt 7 ps 0.3 title '{/Times=6 hwmcc10-timeframe-expansion-k45-pdtvissoap1-tseitin}' with yerrorlines, \
#"SADS.dat" using 1:10:($10*($11/100)) lt 5 lw 0.5 pt 7 ps 0.3 title '{/Times=6 hwmcc10-timeframe-expansion-k50-pdtpmsns2-tseitin}' with yerrorlines, \
#"SADS.dat" using 1:12:($12*($13/100)) lt 6 lw 0.5 pt 7 ps 0.3 title '{/Times=6 md5\_48\_3}' with yerrorlines, \
#"SADS.dat" using 1:14:($14*($15/100)) lt 7 lw 0.5 pt 7 ps 0.3 title '{/Times=6 q\_query\_3\_L150\_coli.sat}' with yerrorlines, \
#"SADS.dat" using 1:16:($16*($17/100)) lt 8 lw 0.5 pt 7 ps 0.3 title '{/Times=6 q\_query\_3\_slp-synthesis-aes-top30}' with yerrorlines, \
#"SADS.dat" using 1:18:($18*($19/100)) lt 9 lw 0.5 pt 7 ps 0.3 title '{/Times=6 q\_query\_3\_traffic\_b\_unsat}' with yerrorlines, \
#"SADS.dat" using 1:20:($20*($21/100)) lt 9 lw 0.5 pt 7 ps 0.3 title '{/Times=6 UCG-15-10p1}' with yerrorlines

#plot "data.txt" using 2:xticlabels(1) title '' with linespoints #labels in 1
