#Experiment 1

../simplesim-3.0/sim-outorder -cache:dl1lat 2 -cache:dl1 dl1:128:32:1:l cc1.alpha -O 1stmt.i 2> 1.gcc.a
../simplesim-3.0/sim-outorder -cache:dl1lat 2 -cache:dl1 dl1:128:32:1:l anagram.alpha words < anagram.in > OUT 2> 1.anagram.a
../simplesim-3.0/sim-outorder -cache:dl1lat 2 -cache:dl1 dl1:128:32:1:l go.alpha 50 9 2stone9.in > OUT 2> 1.go.a

../simplesim-3.0/sim-outorder -cache:dl1lat 3 -cache:dl1 dl1:64:32:2:l cc1.alpha -O 1stmt.i 2> 1.gcc.b
../simplesim-3.0/sim-outorder -cache:dl1lat 3 -cache:dl1 dl1:64:32:2:l anagram.alpha words < anagram.in > OUT 2> 1.anagram.b
../simplesim-3.0/sim-outorder -cache:dl1lat 3 -cache:dl1 dl1:64:32:2:l go.alpha 50 9 2stone9.in > OUT 2> 1.go.b

../simplesim-3.0/sim-outorder -cache:dl1lat 4 -cache:dl1 dl1:32:32:4:l cc1.alpha -O 1stmt.i 2> 1.gcc.c
../simplesim-3.0/sim-outorder -cache:dl1lat 4 -cache:dl1 dl1:32:32:4:l anagram.alpha words < anagram.in > OUT 2> 1.anagram.c
../simplesim-3.0/sim-outorder -cache:dl1lat 4 -cache:dl1 dl1:32:32:4:l go.alpha 50 9 2stone9.in > OUT 2> 1.go.c

#Experiment 2

../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:1:l cc1.alpha -O 1stmt.i 2> 2.gcc.1way.novictim
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:1:l anagram.alpha words < anagram.in > OUT 2> 2.anagram.1way.novictim
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:1:l go.alpha 50 9 2stone9.in > OUT 2> 2.go.1way.novictim

../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:1:l -cache:dl1victims 2 cc1.alpha -O 1stmt.i 2> 2.gcc.1way
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:1:l -cache:dl1victims 2 anagram.alpha words < anagram.in > OUT 2> 2.anagram.1way
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:1:l -cache:dl1victims 2 go.alpha 50 9 2stone9.in > OUT 2> 2.go.1way

../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:2:l cc1.alpha -O 1stmt.i 2> 2.gcc.2way.novictim
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:2:l anagram.alpha words < anagram.in > OUT 2> 2.anagram.2way.novictim
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:2:l go.alpha 50 9 2stone9.in > OUT 2> 2.go.2way.novictim

../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:2:l -cache:dl1victims 2 cc1.alpha -O 1stmt.i 2> 2.gcc.2way
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:2:l -cache:dl1victims 2 anagram.alpha words < anagram.in > OUT 2> 2.anagram.2way
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:2:l -cache:dl1victims 2 go.alpha 50 9 2stone9.in > OUT 2> 2.go.2way

../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:4:l cc1.alpha -O 1stmt.i 2> 2.gcc.4way.novictim
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:4:l anagram.alpha words < anagram.in > OUT 2> 2.anagram.4way.novictim
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:4:l go.alpha 50 9 2stone9.in > OUT 2> 2.go.4way.novictim

../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:4:l -cache:dl1victims 2 cc1.alpha -O 1stmt.i 2> 2.gcc.4way
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:4:l -cache:dl1victims 2 anagram.alpha words < anagram.in > OUT 2> 2.anagram.4way
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:4:l -cache:dl1victims 2 go.alpha 50 9 2stone9.in > OUT 2> 2.go.4way

../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:8:l cc1.alpha -O 1stmt.i 2> 2.gcc.8way.novictim
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:8:l anagram.alpha words < anagram.in > OUT 2> 2.anagram.8way.novictim
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:8:l go.alpha 50 9 2stone9.in > OUT 2> 2.go.8way.novictim

#Experiment 3

../simplesim-3.0/sim-outorder -cache:dl1blocking cc1.alpha -O 1stmt.i 2> 3.gcc.blocking
../simplesim-3.0/sim-outorder -cache:dl1blocking anagram.alpha words < anagram.in > OUT 2> 3.anagram.blocking
../simplesim-3.0/sim-outorder -cache:dl1blocking go.alpha 50 9 2stone9.in > OUT 2> 3.go.blocking

../simplesim-3.0/sim-outorder cc1.alpha -O 1stmt.i 2> 3.gcc.nonblocking
../simplesim-3.0/sim-outorder anagram.alpha words < anagram.in > OUT 2> 3.anagram.nonblocking
../simplesim-3.0/sim-outorder go.alpha 50 9 2stone9.in > OUT 2> 3.go.nonblocking

