circuit RWProbeIntoSameBundle:
  module Child:
    input foo : { x : UInt<5>, flip ref : RWProbe<UInt<5>> }

    define foo.ref = rwprobe(foo.x)

  module RWProbeIntoSameBundle:
    input x : UInt<5>
    output out : RWProbe<UInt<5>>
    inst c of Child
    c.foo.x <= x
    define out = c.foo.ref
   
    
