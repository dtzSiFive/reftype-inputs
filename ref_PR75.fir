circuit Probe :
  module Child :
    input in : UInt<1>[2]
    output r : Probe<UInt<1>[2]>
    define r = probe(in)

  module Mid :
    input in : UInt<1>[2]
    output r : Probe<UInt<1>[2]>
    output r1 : Probe<UInt<1>>

    inst c of Child
    c.in <= in
    define r = c.r
    define r1 as c.r[1]

  module Probe :
    input in : UInt<1>[2]
    output r : Probe<UInt<1>[2]>
    output out : UInt<1>[2]
    output out_r1 : UInt<1>
    output out_r0_from_r : UInt<1>

    inst m of Mid
    m.in <= in
    define r = m.r

    out <= read(m.r)
    out_r1 <= read(m.r1)
    out_r0_from_r <= read(m.r[0])
