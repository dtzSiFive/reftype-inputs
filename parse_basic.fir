  module RefsChild :
    input in : UInt<1>
    output r : Probe<UInt<1>>
    output rw : RWProbe<UInt<1>> ; expected-warning {{RWProbe not yet supported}}

    node n = in
    define r = probe(n)
    define rw = rwprobe(n)

  module Refs :
    input in : UInt<1>
    output r : Probe<UInt<1>>
    output rw : RWProbe<UInt<1>> ; expected-warning {{RWProbe not yet supported}}
    output out : UInt<1>
    output out2 : UInt<1>
    output agg_out : Probe<{a: UInt<1>, b: UInt}>

    inst rc of RefsChild
    rc.in <= in
    define r = probe(out)
    define rw = rc.rw

    out <= read(rc.r)
    out <= read(rc.rw)

    wire agg : { a : UInt<1>, b : UInt }
    out2 <= read(probe(agg).a)
    out2 <= read(probe(agg.b))
    out2 <= read(probe(agg)).b
    
    agg_out <= probe(agg)

