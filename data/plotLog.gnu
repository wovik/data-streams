set terminal pngcairo  enhanced font "arial,10" fontscale 1.0 size 3000, 1600
set output '4.png'
set key bmargin left horizontal Right noreverse enhanced autotitle box lt black linewidth 1.000 dashtype solid
set samples 800, 800
set title "b size 4"
set title  font ",20" textcolor lt -1 norotate
set xrange [ * : * ] noreverse writeback
set x2range [ * : * ] noreverse writeback
set yrange [ 0 : 5 ] noreverse writeback
set y2range [ * : * ] noreverse writeback
set zrange [ * : * ] noreverse writeback
set cbrange [ * : * ] noreverse writeback
set rrange [ * : * ] noreverse writeback
NO_ANIMATION = 1
plot [1:10000] '4.dat'

set output '5.png'
set key bmargin left horizontal Right noreverse enhanced autotitle box lt black linewidth 1.000 dashtype solid
set samples 800, 800
set title "b size 5"
set title  font ",20" textcolor lt -1 norotate
set xrange [ * : * ] noreverse writeback
set x2range [ * : * ] noreverse writeback
set yrange [ 0 : 5 ] noreverse writeback
set y2range [ * : * ] noreverse writeback
set zrange [ * : * ] noreverse writeback
set cbrange [ * : * ] noreverse writeback
set rrange [ * : * ] noreverse writeback
NO_ANIMATION = 1
plot [1:10000] '5.dat'

set output '6.png'
set key bmargin left horizontal Right noreverse enhanced autotitle box lt black linewidth 1.000 dashtype solid
set samples 800, 800
set title "b size 6"
set title  font ",20" textcolor lt -1 norotate
set xrange [ * : * ] noreverse writeback
set x2range [ * : * ] noreverse writeback
set yrange [ 0 : 5 ] noreverse writeback
set y2range [ * : * ] noreverse writeback
set zrange [ * : * ] noreverse writeback
set cbrange [ * : * ] noreverse writeback
set rrange [ * : * ] noreverse writeback
NO_ANIMATION = 1
plot [1:10000] '6.dat'

set output '7.png'
set key bmargin left horizontal Right noreverse enhanced autotitle box lt black linewidth 1.000 dashtype solid
set samples 800, 800
set title "b size 7"
set title  font ",20" textcolor lt -1 norotate
set xrange [ * : * ] noreverse writeback
set x2range [ * : * ] noreverse writeback
set yrange [ 0 : 5 ] noreverse writeback
set y2range [ * : * ] noreverse writeback
set zrange [ * : * ] noreverse writeback
set cbrange [ * : * ] noreverse writeback
set rrange [ * : * ] noreverse writeback
NO_ANIMATION = 1
plot [1:10000] '7.dat'

set output '8.png'
set key bmargin left horizontal Right noreverse enhanced autotitle box lt black linewidth 1.000 dashtype solid
set samples 800, 800
set title "b size 8"
set title  font ",20" textcolor lt -1 norotate
set xrange [ * : * ] noreverse writeback
set x2range [ * : * ] noreverse writeback
set yrange [ 0 : 5 ] noreverse writeback
set y2range [ * : * ] noreverse writeback
set zrange [ * : * ] noreverse writeback
set cbrange [ * : * ] noreverse writeback
set rrange [ * : * ] noreverse writeback
NO_ANIMATION = 1
plot [1:10000] '8.dat'