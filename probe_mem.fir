circuit ProbeMem:
  module ProbeMem:
    output out : Probe<UInt<3>> ; nope

    mem bar : @[Decoupled.scala 218:16]
      data-type => UInt<3>
      depth => 1
      read-latency => 0
      write-latency => 1
      read-under-write => undefined

    define out = probe(bar)
    ; define out = probe(bar.port)
