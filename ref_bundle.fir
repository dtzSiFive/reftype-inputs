circuit Probe :
  module Child :
    input in : {a : UInt<1>, b : UInt<1>}
    output r : Probe<{a : UInt<1>, b : UInt<1>}>
    ; export probe(in) as r
    export in as r

  module Probe :
    input in : {a : UInt<1>, b : UInt<1>}
    output r : {a : Probe<UInt<1>>, b : Probe<UInt<1>>}
    output out : {a : UInt<1>, b : UInt<1>}

    inst c of Child
    c.in <= in
    forward c.r.a as r.a
    forward c.r.b as r.b

    out <= read(c.r)

