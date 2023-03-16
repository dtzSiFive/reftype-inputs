; IMDCE

circuit InlinerRefs :
  module ChildIn :
    input in : Probe<UInt<1>>
  module ChildOut :
    input in : { a : UInt<1>, b : UInt<2> }
    output out : Probe<{ a : UInt<1>, b : UInt<2> }>
    define out = probe(in)

  module InlinerRefs :
    input in : { a : UInt<1>, b : UInt<2> }
    output out : UInt<1>

    inst ci of ChildIn
    out <= read(ci.in)
    inst co of ChildOut
    co.in <= in
    define ci.in = co.out.a

    

