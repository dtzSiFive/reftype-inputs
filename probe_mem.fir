circuit ProbeMem:
  module ProbeMem:
    output out : Probe<UInt<3>> ; (wrong probe type, can't probe memories)

    mem memory:
      data-type => UInt<8>
      depth => 4
      reader => r
      writer => w
      read-latency => 1
      write-latency => 1
      read-under-write => undefined

    memory.r is invalid
    memory.w is invalid
    define out = probe(memory.r) ; expected-error {{cannot probe memories or their ports}}
