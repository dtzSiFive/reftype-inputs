circuit ToAndFrom:
  module ToAndFrom:
    input in : UInt<3>
    output x : Probe<UInt<3>>
    output y : Probe<UInt<3>>
    
    define x = probe(in)
    define y = x
