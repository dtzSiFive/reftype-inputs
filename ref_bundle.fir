circuit Probe :
  module Child :
    input in : {a : UInt<1>, b : UInt<1>}
    output r : Probe<{a : UInt<1>, b : UInt<1>}>
    ; export probe(in) as r
    define r = probe(in)

  module Probe :
    input in : {a : UInt<1>, b : UInt<1>}
    output r : {a : Probe<UInt<1>>, b : Probe<UInt<1>>}
    output out : {a : UInt<1>, b : UInt<1>}

    inst c of Child
    c.in <= in
    define r.a = c.r.a
    define r.b = c.r.b

    out <= read(c.r)

