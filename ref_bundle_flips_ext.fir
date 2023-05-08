; More testing aggs w/refs.
circuit Bundle :
  module Child :
    input in : {a : UInt<1>, b : UInt<1>[2]}
    output r : Probe<{a : UInt<1>, b : UInt<1>[2]}> ; probe of bundle (of UInt, vec)
    define r = probe(in)

  extmodule Probe :
    input in : {a : UInt<1>, b : UInt<1>[2]}
    output r : {a : Probe<{a : UInt<1>, b : UInt<1>[2]}>, b : Probe<{a : UInt<1>, b : UInt<1>[2]}>} ; bundle of probes of bundles (of UInt, vec)
    output mixed : {a : UInt<1>, flip x : {flip p: Probe<{a : UInt<1>, b : UInt<1>[2]}>, flip data: UInt<1>}[2], b : UInt<1>[2]} ; mixed
    output nohw : {x : {p: Probe<{a : UInt<1>, b : UInt<1>[2]}>}[2]} ; non-hw-only

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
