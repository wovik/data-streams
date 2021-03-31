set terminal pngcairo  enhanced font "arial,10" fontscale 1.0 size 3000, 1600
set output '400_a005.png'
set key bmargin left horizontal Right noreverse enhanced autotitle box lt black linewidth 1.000 dashtype solid
set samples 800, 800
set title "k size 400"
set title  font ",20" textcolor lt -1 norotate
set xrange [ * : * ] noreverse writeback
set x2range [ * : * ] noreverse writeback
set yrange [ 0 : 5 ] noreverse writeback
set y2range [ * : * ] noreverse writeback
set zrange [ * : * ] noreverse writeback
set cbrange [ * : * ] noreverse writeback
set rrange [ * : * ] noreverse writeback
NO_ANIMATION = 1
plot [1:10000] '400.dat', 1, 1.18, 0.82, 1.133, 0.867, (10*sqrt((x - 399)/x))/sqrt(199) + 1, 1 - (10*sqrt((x - 399)/x))/sqrt(199)

set terminal pngcairo  enhanced font "arial,10" fontscale 1.0 size 3000, 1600
set output '400_a01.png'
set key bmargin left horizontal Right noreverse enhanced autotitle box lt black linewidth 1.000 dashtype solid
set samples 800, 800
set title "k size 400"
set title  font ",20" textcolor lt -1 norotate
set xrange [ * : * ] noreverse writeback
set x2range [ * : * ] noreverse writeback
set yrange [ 0 : 5 ] noreverse writeback
set y2range [ * : * ] noreverse writeback
set zrange [ * : * ] noreverse writeback
set cbrange [ * : * ] noreverse writeback
set rrange [ * : * ] noreverse writeback
NO_ANIMATION = 1
plot [1:10000] '400.dat', 1, 1.168, 0.832, 1.121, 0.879, 1 + (0.5*sqrt((-399 + x)*x))/x, 1 - (0.5*sqrt((-399 + x)*x))/x

set terminal pngcairo  enhanced font "arial,10" fontscale 1.0 size 3000, 1600
set output '400_a05.png'
set key bmargin left horizontal Right noreverse enhanced autotitle box lt black linewidth 1.000 dashtype solid
set samples 800, 800
set title "k size 400"
set title  font ",20" textcolor lt -1 norotate
set xrange [ * : * ] noreverse writeback
set x2range [ * : * ] noreverse writeback
set yrange [ 0 : 5 ] noreverse writeback
set y2range [ * : * ] noreverse writeback
set zrange [ * : * ] noreverse writeback
set cbrange [ * : * ] noreverse writeback
set rrange [ * : * ] noreverse writeback
NO_ANIMATION = 1
plot [1:10000] '400.dat', 1, 1.137, 0.863, 1.091, 0.909, 1 + (0.224*sqrt((-399 + x)*x))/x, 1 - (0.224*sqrt((-399 + x)*x))/x