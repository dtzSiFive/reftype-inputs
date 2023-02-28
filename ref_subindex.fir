circuit Probe :
  module Child :
    input in : UInt<1>[2]
    output r : Probe<UInt<1>[2]>
    ; export probe(in) as r
    export in as r

  module Mid :
    input in : UInt<1>[2]
    output r : Probe<UInt<1>[2]>
    output r1 : Probe<UInt<1>>

    inst c of Child
    c.in <= in
    forward c.r as r
    forward c.r[1] as r1

  module Probe :
    input in : UInt<1>[2]
    output r : Probe<UInt<1>[2]>
    output out : UInt<1>[2]
    output out_r1 : UInt<1>

    inst m of Mid
    m.in <= in
    forward m.r as r

    out <= read(m.r)
    out_r1 <= read(m.r1)


