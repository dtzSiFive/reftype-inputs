circuit Bundle :
  module Child :
    input in : {a : UInt<1>, b : UInt<1>[2]}
    output r : Probe<{a : UInt<1>, b : UInt<1>[2]}> ; probe of bundle (of UInt, vec)
    define r = probe(in)

  module Probe :
    input in : {a : UInt<1>, b : UInt<1>[2]}
    output r : {a : Probe<{a : UInt<1>, b : UInt<1>[2]}>, b : Probe<{a : UInt<1>, b : UInt<1>[2]}>} ; bundle of probes of bundles (of UInt, vec)

    inst c1 of Child
    inst c2 of Child
    c1.in <= in
    c2.in <= in

    ; Forward probe-of-bundle as bundle-of-probes
    define r.a = c1.r
    define r.b = c2.r

  module Bundle:
    input in : {a : UInt<1>, b : UInt<1>[2]}
    output out1 : {a : UInt<1>, b : UInt<1>[2]}
    output out2 : {a : UInt<1>, b : UInt<1>[2]}

    inst p of Probe
    p.in <= in

   ; Resolve probes
   out1 <= read(p.r.a)
   out2 <= read(p.r.b)
