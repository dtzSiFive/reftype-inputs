circuit Probe :
  module Child :
    input in : {a : UInt<1>, b : UInt<1>}
    output r : Probe<{a : UInt<1>, b : UInt<1>}>
    ; export probe(in) as r
    export in as r

  module Probe :
    input in : {a : UInt<1>, b : UInt<1>}
    output r : Probe<{a : UInt<1>, b : UInt<1>}>
    output ra : Probe<UInt<1>>
    output out : {a : UInt<1>, b : UInt<1>}

    inst c of Child
    c.in <= in
    forward c.r as r
    forward c.r.a as ra

    out <= read(c.r)

