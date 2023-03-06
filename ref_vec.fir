circuit Probe :
  module Child :
    input in : {a : UInt<1>, b : UInt<1>}
    output r : Probe<{a : UInt<1>, b : UInt<1>}>
    define r = probe(in)

  module Probe :
    input in : {a : UInt<1>, b : UInt<1>}
    output r : Probe<UInt<1>>[2]
    output out : {a : UInt<1>, b : UInt<1>}

    inst c of Child
    c.in <= in
    define r[0] = c.r.a
    define r[1] = c.r.b

    out <= read(c.r)
