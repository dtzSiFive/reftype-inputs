; inliner-refs.fir w/o input probe.

circuit InlinerRefs : %[[
  {
    "class": "firrtl.passes.InlineAnnotation",
    "target": "~InlinerRefs|ChildOut"
  }
]]
  module ChildOut :
    input in : { a : UInt<1>, b : UInt<2> }
    output out : Probe<{ a : UInt<1>, b : UInt<2> }>
    when in.a:
      define out = probe(in)

  module InlinerRefs :
    input in : { a : UInt<1>, b : UInt<2> }
    output out : UInt<1>

    inst co of ChildOut
    co.in <= in
    when in.a:
      out <= read(co.out.a)
