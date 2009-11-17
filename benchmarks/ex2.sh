#Experiment 2

../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:1:l cc1.alpha -O 1stmt.i 2> 2.gcc.1way.novictim&
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:1:l anagram.alpha words < anagram.in > OUT 2> 2.anagram.1way.novictim
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:1:l go.alpha 50 9 2stone9.in > OUT 2> 2.go.1way.novictim&

../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:1:l -cache:dl1victims 2 cc1.alpha -O 1stmt.i 2> 2.gcc.1way
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:1:l -cache:dl1victims 2 anagram.alpha words < anagram.in > OUT 2> 2.anagram.1way&
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:1:l -cache:dl1victims 2 go.alpha 50 9 2stone9.in > OUT 2> 2.go.1way&

../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:2:l cc1.alpha -O 1stmt.i 2> 2.gcc.2way.novictim
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:2:l anagram.alpha words < anagram.in > OUT 2> 2.anagram.2way.novictim
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:2:l go.alpha 50 9 2stone9.in > OUT 2> 2.go.2way.novictim&

../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:2:l -cache:dl1victims 2 cc1.alpha -O 1stmt.i 2> 2.gcc.2way
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:2:l -cache:dl1victims 2 anagram.alpha words < anagram.in > OUT 2> 2.anagram.2way
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:2:l -cache:dl1victims 2 go.alpha 50 9 2stone9.in > OUT 2> 2.go.2way&

../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:4:l cc1.alpha -O 1stmt.i 2> 2.gcc.4way.novictim&
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:4:l anagram.alpha words < anagram.in > OUT 2> 2.anagram.4way.novictim
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:4:l go.alpha 50 9 2stone9.in > OUT 2> 2.go.4way.novictim&

../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:4:l -cache:dl1victims 2 cc1.alpha -O 1stmt.i 2> 2.gcc.4way
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:4:l -cache:dl1victims 2 anagram.alpha words < anagram.in > OUT 2> 2.anagram.4way&
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:4:l -cache:dl1victims 2 go.alpha 50 9 2stone9.in > OUT 2> 2.go.4way&

../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:8:l cc1.alpha -O 1stmt.i 2> 2.gcc.8way.novictim
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:8:l anagram.alpha words < anagram.in > OUT 2> 2.anagram.8way.novictim&
../simplesim-3.0/sim-outorder -cache:dl1 dl1:128:32:8:l go.alpha 50 9 2stone9.in > OUT 2> 2.go.8way.novictim
