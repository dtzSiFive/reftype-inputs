circuit RWProbeIntoSameBundle:
  module Child:
    input foo : { x : UInt<5>, flip refs : { x: Probe<UInt<5>>, y: Probe<UInt<1>> }, y : UInt<1> }

    define foo.refs.x = probe(foo.x)
    define foo.refs.y = probe(foo.y)

  module RWProbeIntoSameBundle:
    input x : UInt<5>
    input y : UInt<1>
    output out : { x: Probe<UInt<5>>, y: Probe<UInt<1>> }
    inst c of Child
    c.foo.x <= x
    c.foo.y <= y
    define out.x = c.foo.refs.x
    define out.y = c.foo.refs.y
   
    
