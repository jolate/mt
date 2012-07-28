set terminal postscript portrait enhanced mono dashed lw 1 'Helvetica' 14
set output 'dashcolor.ps'

set offsets 0.05, 0.05, 0, 0
set style function linespoints
#set noxtics
#set noytics
set title "The pointinterval property is another way to create interrupted lines" 
set xlabel "This technique works best for equally spaced data points" 
set xrange [ -0.500000 : 3.30000 ] noreverse nowriteback
set yrange [ -1.00000 : 1.40000 ] noreverse nowriteback
set bmargin  6
unset colorbox
i = 8
plot cos(x)     lt -1 pi -3 pt 6 title 'pi -3',        cos(x-.8)  lt -1 pi -3 pt 7 ps 0.2 title 'pi -3 pt 7 ps 0.2',       cos(x-.2)  lt -1 pi -6 pt 7 title 'pi -6',     cos(x-.4)  lt -1 pi -3 pt 4 title 'pi -3',     cos(x-.6)  lt -1 pi -5 pt 5 title 'pi -5',      cos(x-1.)  with line lt -1 notitle,       cos(x+.2)  with line lt -1 lw 2 title 'lw 2'
