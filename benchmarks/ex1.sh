#Experiment 1

../simplesim-3.0/sim-outorder -cache:dl1lat 2 -cache:dl1 dl1:128:32:1:l cc1.alpha -O 1stmt.i 2> 1.gcc.a&
../simplesim-3.0/sim-outorder -cache:dl1lat 2 -cache:dl1 dl1:128:32:1:l anagram.alpha words < anagram.in > OUT 2> 1.anagram.a
../simplesim-3.0/sim-outorder -cache:dl1lat 2 -cache:dl1 dl1:128:32:1:l go.alpha 50 9 2stone9.in > OUT 2> 1.go.a&

../simplesim-3.0/sim-outorder -cache:dl1lat 3 -cache:dl1 dl1:64:32:2:l cc1.alpha -O 1stmt.i 2> 1.gcc.b
../simplesim-3.0/sim-outorder -cache:dl1lat 3 -cache:dl1 dl1:64:32:2:l anagram.alpha words < anagram.in > OUT 2> 1.anagram.b
../simplesim-3.0/sim-outorder -cache:dl1lat 3 -cache:dl1 dl1:64:32:2:l go.alpha 50 9 2stone9.in > OUT 2> 1.go.b&

../simplesim-3.0/sim-outorder -cache:dl1lat 4 -cache:dl1 dl1:32:32:4:l cc1.alpha -O 1stmt.i 2> 1.gcc.c
../simplesim-3.0/sim-outorder -cache:dl1lat 4 -cache:dl1 dl1:32:32:4:l anagram.alpha words < anagram.in > OUT 2> 1.anagram.c&
../simplesim-3.0/sim-outorder -cache:dl1lat 4 -cache:dl1 dl1:32:32:4:l go.alpha 50 9 2stone9.in > OUT 2> 1.go.c
