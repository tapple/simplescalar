#Experiment 1
../simplesim-3.0/sim-outorder cc1.alpha -O 1stmt.i 2> 1.1.gcc
../simplesim-3.0/sim-outorder go.alpha 50 9 2stone9.in > OUT 2> 1.1.go

../simplesim-3.0/sim-outorder -issue:inorder cc1.alpha -O 1stmt.i 2> 1.2.gcc
../simplesim-3.0/sim-outorder -issue:inorder go.alpha 50 9 2stone9.in > OUT 2> 1.2.go

#Experiment 2

../simplesim-3.0/sim-outorder -ruu:size 16 cc1.alpha -O 1stmt.i 2> 2.1.gcc
../simplesim-3.0/sim-outorder -ruu:size 16 go.alpha 50 9 2stone9.in > OUT 2> 2.1.go

../simplesim-3.0/sim-outorder -ruu:size 32 cc1.alpha -O 1stmt.i 2> 2.2.gcc
../simplesim-3.0/sim-outorder -ruu:size 32 go.alpha 50 9 2stone9.in > OUT 2> 2.2.go

../simplesim-3.0/sim-outorder -ruu:size 64 cc1.alpha -O 1stmt.i 2> 2.3.gcc
../simplesim-3.0/sim-outorder -ruu:size 64 go.alpha 50 9 2stone9.in > OUT 2> 2.3.go

#Experiment 3

../simplesim-3.0/sim-outorder -issue:width 3 -decode:width 3 -commit:width 3 -res:ialu 3 -res:imult 3 -res:memport 3 -res:fpalu 3 -res:fpmult 3 cc1.alpha -O 1stmt.i 2> 3.1.gcc
../simplesim-3.0/sim-outorder -issue:width 3 -decode:width 3 -commit:width 3 -res:ialu 3 -res:imult 3 -res:memport 3 -res:fpalu 3 -res:fpmult 3 go.alpha 50 9 2stone9.in > OUT 2> 3.1.go

../simplesim-3.0/sim-outorder -issue:width 6 -decode:width 6 -commit:width 6 -res:ialu 6 -res:imult 6 -res:memport 6 -res:fpalu 6 -res:fpmult 6 cc1.alpha -O 1stmt.i 2> 3.2.gcc
../simplesim-3.0/sim-outorder -issue:width 6 -decode:width 6 -commit:width 6 -res:ialu 6 -res:imult 6 -res:memport 6 -res:fpalu 6 -res:fpmult 6 go.alpha 50 9 2stone9.in > OUT 2> 3.2.go

#Experiment 4

../simplesim-3.0/sim-outorder -issue:width 3 -decode:width 3 -commit:width 3 -res:ialu 3 -res:imult 3 -res:memport 3 -res:fpalu 3 -res:fpmult 3 cc1.alpha -O 1stmt.i 2> 4.1.gcc
../simplesim-3.0/sim-outorder -issue:width 3 -decode:width 3 -commit:width 3 -res:ialu 3 -res:imult 3 -res:memport 3 -res:fpalu 3 -res:fpmult 3 go.alpha 50 9 2stone9.in > OUT 2> 4.1.go

../simplesim-3.0/sim-outorder -issue:width 3 -decode:width 3 -commit:width 3 -res:ialu 2 -res:imult 2 -res:memport 3 -res:fpalu 3 -res:fpmult 3 cc1.alpha -O 1stmt.i 2> 4.2.gcc
../simplesim-3.0/sim-outorder -issue:width 3 -decode:width 3 -commit:width 3 -res:ialu 2 -res:imult 2 -res:memport 3 -res:fpalu 3 -res:fpmult 3 go.alpha 50 9 2stone9.in > OUT 2> 4.2.go


