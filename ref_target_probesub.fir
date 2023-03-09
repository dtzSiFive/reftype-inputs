circuit Probe :
  module Child :
    input in : UInt<1>[2]
    output r : Probe<UInt<1>[2]>
    define r = probe(in)

  module Probe :
    input in : UInt<1>[2]
    output r : Probe<UInt<1>[2]>
    output out : UInt<1>[2]
    output out_r0_from_r : UInt<1>

    inst c of Child
    c.in <= in

    ; BADNESS
    ; DISALLOW WRITING /into/ a sub-reference!
    define r[0] = c.r[0]
    define r[1] = c.r[0]

    out <= read(c.r)
    out_r0_from_r <= read(c.r[0])



