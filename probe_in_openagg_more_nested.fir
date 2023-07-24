circuit RWProbeIntoSameBundle:
  module Child:
    input foo : { x : UInt<5>, flip agg : { refs: { x: Probe<UInt<5>>, y: Probe<UInt<1>> }, data : UInt<1> }, y : UInt<1> }

    foo.agg.data <= foo.y
    define foo.agg.refs.x = probe(foo.x)
    define foo.agg.refs.y = probe(foo.y)

  module RWProbeIntoSameBundle:
    input x : UInt<5>
    input y : UInt<1>
    output out : { x: Probe<UInt<5>>, y: Probe<UInt<1>> }
    inst c of Child
    c.foo.x <= x
    c.foo.y <= y
    define out.x = c.foo.agg.refs.x
    define out.y = c.foo.agg.refs.y
