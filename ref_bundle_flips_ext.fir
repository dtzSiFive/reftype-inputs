; Check extmodule w/open aggs.
circuit Bundle :
  extmodule Probe :
    input in : {a : UInt<1>, b : UInt<1>[2]}
    output r : {a : Probe<{a : UInt<1>, b : UInt<1>[2]}>, b : Probe<{a : UInt<1>, b : UInt<1>[2]}>} ; bundle of probes of bundles (of UInt, vec)
    output mixed : {a : UInt<1>, flip x : {flip p: Probe<{a : UInt<1>, b : UInt<1>[2]}>, flip data: UInt<1>}[2], b : UInt<1>[2]} ; mixed
    output nohw : {x : {p: Probe<{a : UInt<1>, b : UInt<1>[2]}>}[2]} ; non-hw-only

  module Bundle:
    input in : {a : UInt<1>, b : UInt<1>[2]}
    output out7 : {a : UInt<1>, b : UInt<1>[2]}

    inst p of Probe
    p.in <= in

   out7.a <= p.mixed.a
   out7.b <= p.mixed.b
