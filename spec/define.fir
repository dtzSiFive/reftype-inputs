circuit Refs:
  module Refs:
    input clock:  Clock
    output a : Probe<{x: UInt, y: UInt}> ; read-only ref. to wire 'p'
    output b : RWProbe<UInt> ; force-able ref. to node 'q', inferred width.
    output c : Probe<UInt<1>> ; read-only ref. to register 'r'
    output d : Probe<Clock> ; ref. to input clock port
  
    wire p : {x: UInt, flip y : UInt}
    define a = probe(p) ; probe is passive
    node q = UInt<1>(0)
    define b = rwprobe(q)
    reg r: UInt, clock
    define c = probe(r)
    define d = probe(clock)
