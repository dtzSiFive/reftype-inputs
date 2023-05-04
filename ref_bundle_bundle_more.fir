; More testing aggs w/refs.  TODO: flips.
circuit Bundle :
  module Child :
    input in : {a : UInt<1>, b : UInt<1>[2]}
    output r : Probe<{a : UInt<1>, b : UInt<1>[2]}> ; probe of bundle (of UInt, vec)
    define r = probe(in)

  module Probe :
    input in : {a : UInt<1>, b : UInt<1>[2]}
    output r : {a : Probe<{a : UInt<1>, b : UInt<1>[2]}>, b : Probe<{a : UInt<1>, b : UInt<1>[2]}>} ; bundle of probes of bundles (of UInt, vec)
    output mixed : {a : UInt<1>, x : {p: Probe<{a : UInt<1>, b : UInt<1>[2]}>, data: UInt<1>}[2], b : UInt<1>[2]} ; mixed
    output nohw : {x : {p: Probe<{a : UInt<1>, b : UInt<1>[2]}>}[2]} ; non-hw-only

    inst c1 of Child
    inst c2 of Child
    c1.in <= in
    c2.in <= in

    define r.a = c1.r
    define r.b = c2.r

    mixed.a <= read(c1.r.a)
    mixed.b <= read(c1.r.b)
    define mixed.x[0].p = c1.r
    define mixed.x[1].p = c2.r
    mixed.x[0].data <= read(c1.r.a)
    mixed.x[1].data <= read(c2.r.a)
    define nohw.x[0].p = c1.r
    define nohw.x[1].p = c2.r

  module Bundle:
    input in : {a : UInt<1>, b : UInt<1>[2]}
    output out1 : {a : UInt<1>, b : UInt<1>[2]}
    output out2 : {a : UInt<1>, b : UInt<1>[2]}
    output out3 : {a : UInt<1>, b : UInt<1>[2]}
    output out4 : {a : UInt<1>, b : UInt<1>[2]}
    output out5 : {a : UInt<1>, b : UInt<1>[2]}
    output out6 : {a : UInt<1>, b : UInt<1>[2]}
    output out7 : {a : UInt<1>, b : UInt<1>[2]}

    inst p of Probe
    p.in <= in

   ; Resolve probes
   out1 <= read(p.r.a)
   out2 <= read(p.r.b)
   out3 <= read(p.mixed.x[0].p)
   out4 <= read(p.mixed.x[1].p)
   out5 <= read(p.nohw.x[0].p)
   out6 <= read(p.nohw.x[1].p)
   out7.a <= p.mixed.a
   out7.b <= p.mixed.b
