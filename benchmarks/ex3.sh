#Experiment 3

../simplesim-3.0/sim-outorder -cache:dl1blocking cc1.alpha -O 1stmt.i 2> 3.gcc.blocking&
../simplesim-3.0/sim-outorder -cache:dl1blocking anagram.alpha words < anagram.in > OUT 2> 3.anagram.blocking
../simplesim-3.0/sim-outorder -cache:dl1blocking go.alpha 50 9 2stone9.in > OUT 2> 3.go.blocking&

../simplesim-3.0/sim-outorder cc1.alpha -O 1stmt.i 2> 3.gcc.nonblocking
../simplesim-3.0/sim-outorder anagram.alpha words < anagram.in > OUT 2> 3.anagram.nonblocking&
../simplesim-3.0/sim-outorder go.alpha 50 9 2stone9.in > OUT 2> 3.go.nonblocking

