circuit Probe :
  module Child :
    input in : UInt<1>
    output r : Probe<UInt<1>>
    define r = probe(in)

  module Probe :
    input in : UInt<1>
    output out : UInt<1>

    inst c of Child
    c.in <= in

    node n = read(c.r)
    out <= n
     


