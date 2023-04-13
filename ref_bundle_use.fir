circuit Bundle :
  module Child :
    input in : {a : UInt<1>, b : UInt<1>}
    output r : Probe<{a : UInt<1>, b : UInt<1>}> ; probe of bundle
    define r = probe(in)

  module Probe :
    input in : {a : UInt<1>, b : UInt<1>}
    output r : {a : Probe<UInt<1>>, b : Probe<UInt<1>>} ; bundle of probes
    output out : {a : UInt<1>, b : UInt<1>}

    inst c of Child
    c.in <= in
    ; Forward probe-of-bundle as bundle-of-probes
    define r.a = c.r.a
    define r.b = c.r.b

    out <= read(c.r)

  module Bundle:
    input in : {a : UInt<1>, b : UInt<1>}
    output out : {a : UInt<1>, b : UInt<1>}

    inst p of Probe
    p.in <= in

   ; Consume outputs and resolve the field of bundle-of-probe.
   out.a <= and(p.out.b, read(p.r.a))
   out.b <= and(p.out.a, read(p.r.b))
