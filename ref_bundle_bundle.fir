circuit Bundle :
  module Child :
    input in : {a : UInt<1>, b : UInt<1>[2]}
    output r : Probe<{a : UInt<1>, b : UInt<1>[2]}> ; probe of bundle (of UInt, vec)
    define r = probe(in)

  module Probe :
    input in : {a : UInt<1>, b : UInt<1>[2]}
    output r : {a : Probe<{a : UInt<1>, b : UInt<1>[2]}>, b : Probe<{a : UInt<1>, b : UInt<1>[2]}>} ; bundle of probes of bundles (of UInt, vec)
    output mixed : {a : UInt<1>, p : Probe<{a : UInt<1>, b : UInt<1>[2]}>, b : UInt<1>[2]} ; mixed

    inst c1 of Child
    inst c2 of Child
    c1.in <= in
    c2.in <= in

    ; Forward probe-of-bundle as bundle-of-probes
    define r.a = c1.r
    define r.b = c2.r

    mixed.a <= read(c1.r.a)
    mixed.b <= read(c1.r.b)
    define mixed.p = c2.r

  module Bundle:
    input in : {a : UInt<1>, b : UInt<1>[2]}
    output out1 : {a : UInt<1>, b : UInt<1>[2]}
    output out2 : {a : UInt<1>, b : UInt<1>[2]}
    output out3 : {a : UInt<1>, b : UInt<1>[2]}
    output out4 : {a : UInt<1>, b : UInt<1>[2]}

    inst p of Probe
    p.in <= in

   ; Resolve probes
   out1 <= read(p.r.a)
   out2 <= read(p.r.b)
   out3 <= read(p.mixed.p)
   out4.a <= p.mixed.a
   out4.b <= p.mixed.b
