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
set output "plingeling_decay.eps"
set border
set size square 0.5,0.5 # percent of original (50% of its size here)
unset time # unset for no time
set lmargin 10
set bmargin -1
set rmargin 2
set tmargin 1

# Details for this particular plot
set key left # legend to the left (bottom is also an option)
unset logscale y  #set for logarithmic scale y (add x for log x)
set xlabel "# of threads" # XAxis title
set ylabel "Performance decay" # YAxis title
set key at -7,300
set key spacing 0.6
set border 3 lw 0.5
set xtics nomirror
set ytics nomirror
plot "<awk '{print $1,(($2/316.4)-1)*100}' plingeling_decay.dat" using 1:2 lt 2 lw 0.5 ps 0.5 title '{/Times=6 aaai10-planning-ipc5-pathways-13-step17}' with linespoints, \
"<awk '{print $1,(($3/600.2)-1)*100}' plingeling_decay.dat" using 1:2 lt 2 lw 0.5 ps 0.5 title '{/Times=6 E02F22}' with linespoints, \
"<awk '{print $1,(($4/526.6)-1)*100}' plingeling_decay.dat" using 1:2 lt 2 lw 0.5 ps 0.5 title '{/Times=6 grid-strips-grid-y-3.035-NOTKNOWN}' with linespoints, \
"<awk '{print $1,(($5/194.6)-1)*100}' plingeling_decay.dat" using 1:2 lt 2 lw 0.5 ps 0.5 title '{/Times=6 hwmcc10-timeframe-expansion-k45-pdtvissoap1-tseitin}' with linespoints, \
"<awk '{print $1,(($6/409.5)-1)*100}' plingeling_decay.dat" using 1:2 lt 2 lw 0.5 ps 0.5 title '{/Times=6 hwmcc10-timeframe-expansion-k50-pdtpmsns2-tseitin}' with linespoints, \
"<awk '{print $1,(($7/154.7)-1)*100}' plingeling_decay.dat" using 1:2 lt 2 lw 0.5 ps 0.5 title '{/Times=6 md5\_48\_3}' with linespoints, \
"<awk '{print $1,(($8/309.5)-1)*100}' plingeling_decay.dat" using 1:2 lt 2 lw 0.5 ps 0.5 title '{/Times=6 q\_query\_3\_L150\_coli.sat}' with linespoints, \
"<awk '{print $1,(($9/453.4)-1)*100}' plingeling_decay.dat" using 1:2 lt 2 lw 0.5 ps 0.5 title '{/Times=6 q\_query\_3\_slp-synthesis-aes-top30}' with linespoints, \
"<awk '{print $1,(($10/334.0)-1)*100}' plingeling_decay.dat" using 1:2 lt 2 lw 0.5 ps 0.5 title '{/Times=6 q\_query\_3\_traffic\_b\_unsat}' with linespoints, \
"<awk '{print $1,(($11/291.2)-1)*100}' plingeling_decay.dat" using 1:2 lt 2 lw 0.5 ps 0.5 title '{/Times=6 UCG-15-10p1}' with linespoints

#plot "data.txt" using 2:xticlabels(1) title '' with linespoints #labels in 1
