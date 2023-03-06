circuit UseRefsWithSinkFlow :
  module InChild :
    input p : Probe<UInt<1>>

  module OutChild :
    input x : UInt
    output y : UInt
    output p : Probe<UInt>
    define p = probe(x)
    y <= read(p)

  module UseRefsWithSinkFlow :
    input x : UInt<1>
    output y : UInt<1>
    output z : UInt<1>
    output zz : UInt<1>
    output p : Probe<UInt<1>>

    ; Read output port's reference
    define p = probe(x)
    y <= read(p) 

    ; Read child instance's input port reference
    inst ic of InChild
    define ic.p = probe(x)
    z <= read(ic.p) 

    ; Child w/dead output ref port
    inst oc of OutChild
    oc.x <= x
    zz <= oc.y
