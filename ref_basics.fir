circuit Probe :
  module Child :
    input in : UInt<1>
    output r : Probe<UInt<1>>
    define r = probe(in)

  module Probe :
    input in : UInt<1>
    output r : Probe<UInt<1>>
    output out : UInt

    inst c of Child
    c.in <= in
    define r = c.r

    out <= read(c.r)

