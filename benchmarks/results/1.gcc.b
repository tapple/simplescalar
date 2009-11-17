sim-outorder: SimpleScalar/Alpha Tool Set version 3.0 of August, 2003.
Copyright (c) 1994-2003 by Todd M. Austin, Ph.D. and SimpleScalar, LLC.
All Rights Reserved. This version of SimpleScalar is licensed for academic
non-commercial use.  No portion of this work may be used by any commercial
entity, or for any commercial purpose, without the prior written permission
of SimpleScalar, LLC (info@simplescalar.com).

warning: section `.comment' ignored...
sim: command line: ../simplesim-3.0/sim-outorder -cache:dl1lat 3 -cache:dl1 dl1:64:32:2:l cc1.alpha -O 1stmt.i 

sim: simulation started @ Fri Oct 30 06:21:27 2009, options follow:

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
-cache:dl1       dl1:64:32:2:l # l1 data cache config, i.e., {<config>|none}
-cache:dl1lat               3 # l1 data cache hit latency (in cycles)
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
warning: partially supported sigaction() call...
 label_rtx emit_jump expand_label expand_goto expand_goto_internal expand_fixup fixup_gotos expand_asm expand_asm_operands expand_expr_stmt clear_last_expr expand_start_stmt_expr expand_end_stmt_expr expand_start_cond expand_end_cond expand_start_else expand_end_else expand_start_loop expand_start_loop_continue_elsewhere expand_loop_continue_here expand_end_loop expand_continue_loop expand_exit_loop expand_exit_loop_if_false expand_exit_something expand_null_return expand_null_return_1 expand_return drop_through_at_end_p tail_recursion_args expand_start_bindings use_variable use_variable_after expand_end_bindings expand_decl expand_decl_init expand_anon_union_decl expand_cleanups fixup_cleanups move_cleanups_up expand_start_case expand_start_case_dummy expand_end_case_dummy pushcase pushcase_range check_for_full_enumeration_handling expand_end_case do_jump_if_equal group_case_nodes balance_case_nodes node_has_low_bound node_has_high_bound node_is_bounded emit_jump_if_reachable emit_case_nodes get_frame_size assign_stack_local put_var_into_stack fixup_var_refs fixup_var_refs_insns fixup_var_refs_1 fixup_memory_subreg walk_fixup_memory_subreg fixup_stack_1 optimize_bit_field max_parm_reg_num get_first_nonparm_insn parm_stack_loc assign_parms get_structure_value_addr uninitialized_vars_warning setjmp_protect expand_function_start expand_function_end
time in parse: 0.000000
time in integration: 0.000000
time in jump: 0.000000
time in cse: 0.000000
time in loop: 0.000000
time in cse2: 0.000000
time in flow: 0.000000
time in combine: 0.000000
time in sched: 0.000000
time in local-alloc: 0.000000
time in global-alloc: 0.000000
time in sched2: 0.000000
time in dbranch: 0.000000
time in shorten-branch: 0.000000
time in stack-reg: 0.000000
time in final: 0.000000
time in varconst: 0.000000
time in symout: 0.000000
time in dump: 0.000000
warning: partially supported sigprocmask() call...

sim: ** simulation statistics **
sim_num_insn              337341091 # total number of instructions committed
sim_num_refs              121898433 # total number of loads and stores committed
sim_num_loads              83205319 # total number of loads committed
sim_num_stores         38693114.0000 # total number of stores committed
sim_num_branches           58872880 # total number of branches committed
sim_elapsed_time                367 # total simulation time in seconds
sim_inst_rate           919185.5341 # simulation speed (in insts/sec)
sim_total_insn            398714863 # total number of instructions executed
sim_total_refs            144502672 # total number of loads and stores executed
sim_total_loads           101503503 # total number of loads executed
sim_total_stores       42999169.0000 # total number of stores executed
sim_total_branches         69291055 # total number of branches executed
sim_cycle                 318214895 # total simulation time in cycles
sim_IPC                      1.0601 # instructions per cycle
sim_CPI                      0.9433 # cycles per instruction
sim_exec_BW                  1.2530 # total instructions (mis-spec + committed) per cycle
sim_IPB                      5.7300 # instruction per branch
IFQ_count                 801806397 # cumulative IFQ occupancy
IFQ_fcount                182247607 # cumulative IFQ full count
ifq_occupancy                2.5197 # avg IFQ occupancy (insn's)
ifq_rate                     1.2530 # avg IFQ dispatch rate (insn/cycle)
ifq_latency                  2.0110 # avg IFQ occupant latency (cycle's)
ifq_full                     0.5727 # fraction of time (cycle's) IFQ was full
RUU_count                3132889374 # cumulative RUU occupancy
RUU_fcount                107971293 # cumulative RUU full count
ruu_occupancy                9.8452 # avg RUU occupancy (insn's)
ruu_rate                     1.2530 # avg RUU dispatch rate (insn/cycle)
ruu_latency                  7.8575 # avg RUU occupant latency (cycle's)
ruu_full                     0.3393 # fraction of time (cycle's) RUU was full
LSQ_count                1150899142 # cumulative LSQ occupancy
LSQ_fcount                 44737215 # cumulative LSQ full count
lsq_occupancy                3.6167 # avg LSQ occupancy (insn's)
lsq_rate                     1.2530 # avg LSQ dispatch rate (insn/cycle)
lsq_latency                  2.8865 # avg LSQ occupant latency (cycle's)
lsq_full                     0.1406 # fraction of time (cycle's) LSQ was full
sim_slip                 4257178210 # total number of slip cycles
avg_sim_slip                12.6198 # the average slip between issue and retirement
bpred_bimod.lookups        73038560 # total number of bpred lookups
bpred_bimod.updates        58872880 # total number of updates
bpred_bimod.addr_hits      50964149 # total number of address-predicted hits
bpred_bimod.dir_hits       52581991 # total number of direction-predicted hits (includes addr-hits)
bpred_bimod.misses          6290889 # total number of misses
bpred_bimod.jr_hits         4951928 # total number of address-predicted hits for JR's
bpred_bimod.jr_seen         6304002 # total number of JR's seen
bpred_bimod.jr_non_ras_hits.PP       534855 # total number of address-predicted hits for non-RAS JR's
bpred_bimod.jr_non_ras_seen.PP      1713371 # total number of non-RAS JR's seen
bpred_bimod.bpred_addr_rate    0.8657 # branch address-prediction rate (i.e., addr-hits/updates)
bpred_bimod.bpred_dir_rate    0.8931 # branch direction-prediction rate (i.e., all-hits/updates)
bpred_bimod.bpred_jr_rate    0.7855 # JR address-prediction rate (i.e., JR addr-hits/JRs seen)
bpred_bimod.bpred_jr_non_ras_rate.PP    0.3122 # non-RAS JR addr-pred rate (ie, non-RAS JR hits/JRs seen)
bpred_bimod.retstack_pushes      5961651 # total number of address pushed onto ret-addr stack
bpred_bimod.retstack_pops      5639477 # total number of address popped off of ret-addr stack
bpred_bimod.used_ras.PP      4590631 # total number of RAS predictions used
bpred_bimod.ras_hits.PP      4417073 # total number of RAS hits
bpred_bimod.ras_rate.PP    0.9622 # RAS prediction rate (i.e., RAS hits/used RAS)
il1.accesses              431320523 # total number of accesses
il1.hits                  419404249 # total number of hits
il1.misses                 11916274 # total number of misses
il1.replacements           11915762 # total number of replacements
il1.writebacks                    0 # total number of writebacks
il1.invalidations                 0 # total number of invalidations
il1.miss_rate                0.0276 # miss rate (i.e., misses/ref)
il1.repl_rate                0.0276 # replacement rate (i.e., repls/ref)
il1.wb_rate                  0.0000 # writeback rate (i.e., wrbks/ref)
il1.inv_rate                 0.0000 # invalidation rate (i.e., invs/ref)
dl1.accesses              130856514 # total number of accesses
dl1.hits                  120598628 # total number of hits
dl1.misses                 10257886 # total number of misses
dl1.replacements           10257758 # total number of replacements
dl1.writebacks              2937518 # total number of writebacks
dl1.invalidations                 0 # total number of invalidations
dl1.miss_rate                0.0784 # miss rate (i.e., misses/ref)
dl1.repl_rate                0.0784 # replacement rate (i.e., repls/ref)
dl1.wb_rate                  0.0224 # writeback rate (i.e., wrbks/ref)
dl1.inv_rate                 0.0000 # invalidation rate (i.e., invs/ref)
ul2.accesses               25111678 # total number of accesses
ul2.hits                   24195057 # total number of hits
ul2.misses                   916621 # total number of misses
ul2.replacements             912525 # total number of replacements
ul2.writebacks               208905 # total number of writebacks
ul2.invalidations                 0 # total number of invalidations
ul2.miss_rate                0.0365 # miss rate (i.e., misses/ref)
ul2.repl_rate                0.0363 # replacement rate (i.e., repls/ref)
ul2.wb_rate                  0.0083 # writeback rate (i.e., wrbks/ref)
ul2.inv_rate                 0.0000 # invalidation rate (i.e., invs/ref)
itlb.accesses             431320523 # total number of accesses
itlb.hits                 431201877 # total number of hits
itlb.misses                  118646 # total number of misses
itlb.replacements            118582 # total number of replacements
itlb.writebacks                   0 # total number of writebacks
itlb.invalidations                0 # total number of invalidations
itlb.miss_rate               0.0003 # miss rate (i.e., misses/ref)
itlb.repl_rate               0.0003 # replacement rate (i.e., repls/ref)
itlb.wb_rate                 0.0000 # writeback rate (i.e., wrbks/ref)
itlb.inv_rate                0.0000 # invalidation rate (i.e., invs/ref)
dtlb.accesses             132253852 # total number of accesses
dtlb.hits                 132206665 # total number of hits
dtlb.misses                   47187 # total number of misses
dtlb.replacements             47059 # total number of replacements
dtlb.writebacks                   0 # total number of writebacks
dtlb.invalidations                0 # total number of invalidations
dtlb.miss_rate               0.0004 # miss rate (i.e., misses/ref)
dtlb.repl_rate               0.0004 # replacement rate (i.e., repls/ref)
dtlb.wb_rate                 0.0000 # writeback rate (i.e., wrbks/ref)
dtlb.inv_rate                0.0000 # invalidation rate (i.e., invs/ref)
sim_invalid_addrs                 0 # total non-speculative bogus addresses seen (debug var)
ld_text_base           0x0120000000 # program text (code) segment base
ld_text_size                1564672 # program text (code) size in bytes
ld_data_base           0x0140000000 # program initialized data segment base
ld_data_size                 277104 # program init'ed `.data' and uninit'ed `.bss' size in bytes
ld_stack_base          0x011ff9b000 # program stack segment base (highest address in stack)
ld_stack_size                 16384 # program initial stack size
ld_prog_entry          0x0120025f70 # program entry point (initial PC)
ld_environ_base        0x011ff97000 # program environment base address address
ld_target_big_endian              0 # target executable endian-ness, non-zero if big endian
mem.page_count                  656 # total number of pages allocated
mem.page_mem                  5248k # total size of memory pages allocated
mem.ptab_misses              960083 # total first level page table misses
mem.ptab_accesses        2671912170 # total page table accesses
mem.ptab_miss_rate           0.0004 # first level page table miss rate

