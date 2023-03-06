circuit Probe :
  module Child :
    input in : {a : UInt<1>, b : UInt<1>}
    output r : Probe<{a : UInt<1>, b : UInt<1>}>

    define r = probe(in)

  module Probe :
    input in : {a : UInt<1>, b : UInt<1>}
    output r : Probe<{a : UInt<1>, b : UInt<1>}>
    output ra : Probe<UInt<1>>
    output out : {a : UInt<1>, b : UInt<1>}

    inst c of Child
    c.in <= in
    define r = c.r
    define ra = c.r.a

    out <= read(c.r)

