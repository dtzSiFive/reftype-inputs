circuit Refs:
  module Refs:
    input clock:  Clock
    input p : {x: UInt<1>, flip y : UInt<3>} ; XXX: modified, for init
    output a : Probe<{x: UInt, y: UInt}> ; read-only ref. to wire 'p'
    output b : RWProbe<UInt> ; force-able ref. to node 'q', inferred width.
    output c : Probe<UInt> ; read-only ref. to register 'r', inferred width.
    output d : Probe<Clock> ; ref. to input clock port

    p.y <= UInt<3>(0) ; XXX: modified, for init
    define a = probe(p) ; probe is passive
    node q = p.x
    define b = rwprobe(q)
    reg r: UInt, clock
    r <= p.x ; XXX: modified, initialize register
    define c = probe(r)
    define d = probe(clock)
