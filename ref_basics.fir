circuit Probe :
  module Child :
    input in : UInt<1>
    output r : Probe<UInt<1>>
    ; export probe(in) as r
    export in as r

  module Probe :
    input in : UInt<1>
    output r : Probe<UInt<1>>
    output out : UInt<1>

    inst c of Child
    c.in <= in
    forward c.r as r

    out <= read(c.r)

