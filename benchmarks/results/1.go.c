sim-outorder: SimpleScalar/Alpha Tool Set version 3.0 of August, 2003.
Copyright (c) 1994-2003 by Todd M. Austin, Ph.D. and SimpleScalar, LLC.
All Rights Reserved. This version of SimpleScalar is licensed for academic
non-commercial use.  No portion of this work may be used by any commercial
entity, or for any commercial purpose, without the prior written permission
of SimpleScalar, LLC (info@simplescalar.com).

warning: section `.comment' ignored...
sim: command line: ../simplesim-3.0/sim-outorder -cache:dl1lat 4 -cache:dl1 dl1:32:32:4:l go.alpha 50 9 2stone9.in 

sim: simulation started @ Fri Oct 30 06:36:07 2009, options follow:

sim-outorder: This simulator implements a very detailed out-of-order issue
superscalar processor with a two-level memory system and speculative
execution support.  This simulator is a performance simulator, tracking the
latency of all pipeline operations.

# -config                     # load configuration from a file
# -dumpconfig                 # dump configuration to a file
# -h                    false # print help message    
# -v                    false # verbose operation     
# -d                    false # enable debug message  
# -i                    false # start in Dlite debugger
-seed                       1 # random number generator seed (0 for timer seed)
# -q                    false # initialize and terminate immediately
# -chkpt               <null> # restore EIO trace execution from <fname>
# -redir:sim           <null> # redirect simulator output to file (non-interactive only)
# -redir:prog          <null> # redirect simulated program output to file
-nice                       0 # simulator scheduling priority
-max:inst                   0 # maximum number of inst's to execute
-fastfwd                    0 # number of insts skipped before timing starts
# -ptrace              <null> # generate pipetrace, i.e., <fname|stdout|stderr> <range>
-fetch:ifqsize              4 # instruction fetch queue size (in insts)
-fetch:mplat                3 # extra branch mis-prediction latency
-fetch:speed                1 # speed of front-end of machine relative to execution core
-bpred                  bimod # branch predictor type {nottaken|taken|perfect|bimod|2lev|comb}
-bpred:bimod     2048 # bimodal predictor config (<table size>)
-bpred:2lev      1 1024 8 0 # 2-level predictor config (<l1size> <l2size> <hist_size> <xor>)
-bpred:comb      1024 # combining predictor config (<meta_table_size>)
-bpred:ras                  8 # return address stack size (0 for no return stack)
-bpred:btb       512 4 # BTB config (<num_sets> <associativity>)
# -bpred:spec_update       <null> # speculative predictors update in {ID|WB} (default non-spec)
-decode:width               4 # instruction decode B/W (insts/cycle)
-issue:width                4 # instruction issue B/W (insts/cycle)
-issue:inorder          false # run pipeline with in-order issue
-issue:wrongpath         true # issue instructions down wrong execution paths
-commit:width               4 # instruction commit B/W (insts/cycle)
-ruu:size                  16 # register update unit (RUU) size
-lsq:size                   8 # load/store queue (LSQ) size
-cache:dl1       dl1:32:32:4:l # l1 data cache config, i.e., {<config>|none}
-cache:dl1lat               4 # l1 data cache hit latency (in cycles)
-cache:dl2       ul2:1024:64:4:l # l2 data cache config, i.e., {<config>|none}
-cache:dl2lat               6 # l2 data cache hit latency (in cycles)
-cache:il1       il1:512:32:1:l # l1 inst cache config, i.e., {<config>|dl1|dl2|none}
-cache:dl1vlat              0 # l1 data cache victim buffer hit latency (in cycles)
-cache:dl1v              none # l1 data cache victim buffer config, i.e., {<config>|dl1|dl2|none}
-cache:il1lat               1 # l1 instruction cache hit latency (in cycles)
-cache:il2                dl2 # l2 instruction cache config, i.e., {<config>|dl2|none}
-cache:il2lat               6 # l2 instruction cache hit latency (in cycles)
-cache:flush            false # flush caches on system calls
-cache:icompress        false # convert 64-bit inst addresses to 32-bit inst equivalents
-mem:lat         18 2 # memory access latency (<first_chunk> <inter_chunk>)
-mem:width                  8 # memory access bus width (in bytes)
-tlb:itlb        itlb:16:4096:4:l # instruction TLB config, i.e., {<config>|none}
-tlb:dtlb        dtlb:32:4096:4:l # data TLB config, i.e., {<config>|none}
-tlb:lat                   30 # inst/data TLB miss latency (in cycles)
-res:ialu                   4 # total number of integer ALU's available
-res:imult                  1 # total number of integer multiplier/dividers available
-res:memport                2 # total number of memory system ports available (to CPU)
-res:fpalu                  4 # total number of floating point ALU's available
-res:fpmult                 1 # total number of floating point multiplier/dividers available
# -pcstat              <null> # profile stat(s) against text addr's (mult uses ok)
-bugcompat              false # operate in backward-compatible bugs mode (for testing only)

  Pipetrace range arguments are formatted as follows:

    {{@|#}<start>}:{{@|#|+}<end>}

  Both ends of the range are optional, if neither are specified, the entire
  execution is traced.  Ranges that start with a `@' designate an address
  range to be traced, those that start with an `#' designate a cycle count
  range.  All other range values represent an instruction count range.  The
  second argument, if specified with a `+', indicates a value relative
  to the first argument, e.g., 1000:+100 == 1000:1100.  Program symbols may
  be used in all contexts.

    Examples:   -ptrace FOO.trc #0:#1000
                -ptrace BAR.trc @2000:
                -ptrace BLAH.trc :1500
                -ptrace UXXE.trc :
                -ptrace FOOBAR.trc @main:+278

  Branch predictor configuration examples for 2-level predictor:
    Configurations:   N, M, W, X
      N   # entries in first level (# of shift register(s))
      W   width of shift register(s)
      M   # entries in 2nd level (# of counters, or other FSM)
      X   (yes-1/no-0) xor history and address for 2nd level index
    Sample predictors:
      GAg     : 1, W, 2^W, 0
      GAp     : 1, W, M (M > 2^W), 0
      PAg     : N, W, 2^W, 0
      PAp     : N, W, M (M == 2^(N+W)), 0
      gshare  : 1, W, 2^W, 1
  Predictor `comb' combines a bimodal and a 2-level predictor.

  The cache config parameter <config> has the following format:

    <name>:<nsets>:<bsize>:<assoc>:<repl>

    <name>   - name of the cache being defined
    <nsets>  - number of sets in the cache
    <bsize>  - block size of the cache
    <assoc>  - associativity of the cache
    <repl>   - block replacement strategy, 'l'-LRU, 'f'-FIFO, 'r'-random

    Examples:   -cache:dl1 dl1:4096:32:1:l
                -dtlb dtlb:128:4096:32:r

  Cache levels can be unified by pointing a level of the instruction cache
  hierarchy at the data cache hiearchy using the "dl1" and "dl2" cache
  configuration arguments.  Most sensible combinations are supported, e.g.,

    A unified l2 cache (il2 is pointed at dl2):
      -cache:il1 il1:128:64:1:l -cache:il2 dl2
      -cache:dl1 dl1:256:32:1:l -cache:dl2 ul2:1024:64:2:l

    Or, a fully unified cache hierarchy (il1 pointed at dl1):
      -cache:il1 dl1
      -cache:dl1 ul1:256:32:1:l -cache:dl2 ul2:1024:64:2:l



sim: ** starting performance simulation **
warning: partially supported sigprocmask() call...

sim: ** simulation statistics **
sim_num_insn              545811923 # total number of instructions committed
sim_num_refs              211690425 # total number of loads and stores committed
sim_num_loads             167116104 # total number of loads committed
sim_num_stores         44574321.0000 # total number of stores committed
sim_num_branches           73904299 # total number of branches committed
sim_elapsed_time                674 # total simulation time in seconds
sim_inst_rate           809809.9748 # simulation speed (in insts/sec)
sim_total_insn            702251697 # total number of instructions executed
sim_total_refs            272533084 # total number of loads and stores executed
sim_total_loads           218417585 # total number of loads executed
sim_total_stores       54115499.0000 # total number of stores executed
sim_total_branches         92825606 # total number of branches executed
sim_cycle                 554635679 # total simulation time in cycles
sim_IPC                      0.9841 # instructions per cycle
sim_CPI                      1.0162 # cycles per instruction
sim_exec_BW                  1.2661 # total instructions (mis-spec + committed) per cycle
sim_IPB                      7.3854 # instruction per branch
IFQ_count                1590798015 # cumulative IFQ occupancy
IFQ_fcount                370226260 # cumulative IFQ full count
ifq_occupancy                2.8682 # avg IFQ occupancy (insn's)
ifq_rate                     1.2661 # avg IFQ dispatch rate (insn/cycle)
ifq_latency                  2.2653 # avg IFQ occupant latency (cycle's)
ifq_full                     0.6675 # fraction of time (cycle's) IFQ was full
RUU_count                6188819543 # cumulative RUU occupancy
RUU_fcount                237172884 # cumulative RUU full count
ruu_occupancy               11.1584 # avg RUU occupancy (insn's)
ruu_rate                     1.2661 # avg RUU dispatch rate (insn/cycle)
ruu_latency                  8.8128 # avg RUU occupant latency (cycle's)
ruu_full                     0.4276 # fraction of time (cycle's) RUU was full
LSQ_count                2470075836 # cumulative LSQ occupancy
LSQ_fcount                 80520579 # cumulative LSQ full count
lsq_occupancy                4.4535 # avg LSQ occupancy (insn's)
lsq_rate                     1.2661 # avg LSQ dispatch rate (insn/cycle)
lsq_latency                  3.5174 # avg LSQ occupant latency (cycle's)
lsq_full                     0.1452 # fraction of time (cycle's) LSQ was full
sim_slip                 8057769147 # total number of slip cycles
avg_sim_slip                14.7629 # the average slip between issue and retirement
bpred_bimod.lookups       100615992 # total number of bpred lookups
bpred_bimod.updates        73904299 # total number of updates
bpred_bimod.addr_hits      57773020 # total number of address-predicted hits
bpred_bimod.dir_hits       58478392 # total number of direction-predicted hits (includes addr-hits)
bpred_bimod.misses         15425907 # total number of misses
bpred_bimod.jr_hits         5973188 # total number of address-predicted hits for JR's
bpred_bimod.jr_seen         6257514 # total number of JR's seen
bpred_bimod.jr_non_ras_hits.PP        64341 # total number of address-predicted hits for non-RAS JR's
bpred_bimod.jr_non_ras_seen.PP       117955 # total number of non-RAS JR's seen
bpred_bimod.bpred_addr_rate    0.7817 # branch address-prediction rate (i.e., addr-hits/updates)
bpred_bimod.bpred_dir_rate    0.7913 # branch direction-prediction rate (i.e., all-hits/updates)
bpred_bimod.bpred_jr_rate    0.9546 # JR address-prediction rate (i.e., JR addr-hits/JRs seen)
bpred_bimod.bpred_jr_non_ras_rate.PP    0.5455 # non-RAS JR addr-pred rate (ie, non-RAS JR hits/JRs seen)
bpred_bimod.retstack_pushes      8091465 # total number of address pushed onto ret-addr stack
bpred_bimod.retstack_pops      8971071 # total number of address popped off of ret-addr stack
bpred_bimod.used_ras.PP      6139559 # total number of RAS predictions used
bpred_bimod.ras_hits.PP      5908847 # total number of RAS hits
bpred_bimod.ras_rate.PP    0.9624 # RAS prediction rate (i.e., RAS hits/used RAS)
il1.accesses              771471011 # total number of accesses
il1.hits                  755706147 # total number of hits
il1.misses                 15764864 # total number of misses
il1.replacements           15764352 # total number of replacements
il1.writebacks                    0 # total number of writebacks
il1.invalidations                 0 # total number of invalidations
il1.miss_rate                0.0204 # miss rate (i.e., misses/ref)
il1.repl_rate                0.0204 # replacement rate (i.e., repls/ref)
il1.wb_rate                  0.0000 # writeback rate (i.e., wrbks/ref)
il1.inv_rate                 0.0000 # invalidation rate (i.e., invs/ref)
dl1.accesses              237861733 # total number of accesses
dl1.hits                  219009455 # total number of hits
dl1.misses                 18852278 # total number of misses
dl1.replacements           18852150 # total number of replacements
dl1.writebacks              7247171 # total number of writebacks
dl1.invalidations                 0 # total number of invalidations
dl1.miss_rate                0.0793 # miss rate (i.e., misses/ref)
dl1.repl_rate                0.0793 # replacement rate (i.e., repls/ref)
dl1.wb_rate                  0.0305 # writeback rate (i.e., wrbks/ref)
dl1.inv_rate                 0.0000 # invalidation rate (i.e., invs/ref)
ul2.accesses               41864313 # total number of accesses
ul2.hits                   41709351 # total number of hits
ul2.misses                   154962 # total number of misses
ul2.replacements             150866 # total number of replacements
ul2.writebacks                16648 # total number of writebacks
ul2.invalidations                 0 # total number of invalidations
ul2.miss_rate                0.0037 # miss rate (i.e., misses/ref)
ul2.repl_rate                0.0036 # replacement rate (i.e., repls/ref)
ul2.wb_rate                  0.0004 # writeback rate (i.e., wrbks/ref)
ul2.inv_rate                 0.0000 # invalidation rate (i.e., invs/ref)
itlb.accesses             771471011 # total number of accesses
itlb.hits                 771469818 # total number of hits
itlb.misses                    1193 # total number of misses
itlb.replacements              1129 # total number of replacements
itlb.writebacks                   0 # total number of writebacks
itlb.invalidations                0 # total number of invalidations
itlb.miss_rate               0.0000 # miss rate (i.e., misses/ref)
itlb.repl_rate               0.0000 # replacement rate (i.e., repls/ref)
itlb.wb_rate                 0.0000 # writeback rate (i.e., wrbks/ref)
itlb.inv_rate                0.0000 # invalidation rate (i.e., invs/ref)
dtlb.accesses             240820487 # total number of accesses
dtlb.hits                 240819832 # total number of hits
dtlb.misses                     655 # total number of misses
dtlb.replacements               534 # total number of replacements
dtlb.writebacks                   0 # total number of writebacks
dtlb.invalidations                0 # total number of invalidations
dtlb.miss_rate               0.0000 # miss rate (i.e., misses/ref)
dtlb.repl_rate               0.0000 # replacement rate (i.e., repls/ref)
dtlb.wb_rate                 0.0000 # writeback rate (i.e., wrbks/ref)
dtlb.inv_rate                0.0000 # invalidation rate (i.e., invs/ref)
sim_invalid_addrs                 0 # total non-speculative bogus addresses seen (debug var)
ld_text_base           0x0120000000 # program text (code) segment base
ld_text_size                 376832 # program text (code) size in bytes
ld_data_base           0x0140000000 # program initialized data segment base
ld_data_size                 612032 # program init'ed `.data' and uninit'ed `.bss' size in bytes
ld_stack_base          0x011ff9b000 # program stack segment base (highest address in stack)
ld_stack_size                 16384 # program initial stack size
ld_prog_entry          0x0120007bb0 # program entry point (initial PC)
ld_environ_base        0x011ff97000 # program environment base address address
ld_target_big_endian              0 # target executable endian-ness, non-zero if big endian
mem.page_count                  120 # total number of pages allocated
mem.page_mem                   960k # total size of memory pages allocated
mem.ptab_misses             1966581 # total first level page table misses
mem.ptab_accesses        3879238644 # total page table accesses
mem.ptab_miss_rate           0.0005 # first level page table miss rate

