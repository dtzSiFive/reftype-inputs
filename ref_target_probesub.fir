circuit Probe :
  module Child :
    input in : UInt<1>[2]
    output r : Probe<UInt<1>[2]>
    ; export probe(in) as r
    export in as r

  module Probe :
    input in : UInt<1>[2]
    output r : Probe<UInt<1>[2]>
    output out : UInt<1>[2]
    output out_r0_from_r : UInt<1>

    inst c of Child
    c.in <= in

    ; BADNESS
    forward c.r[0] as r[0]
    forward c.r[0] as r[1]

    out <= read(c.r)
    out_r0_from_r <= read(c.r[0])



