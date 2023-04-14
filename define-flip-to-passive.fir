circuit Foo :
  module Foo :
    input x : {a: UInt<5>, flip b: UInt<3>[2]}
    output y : {a: UInt<5>, flip b: UInt<3>[2]}
    output xp : Probe<{a: UInt<5>, b: UInt<3>[2]}> ; passive
  
    wire p : {a: UInt<5>, flip b: UInt<3>[2]} ; p is not passive
    define xp = probe(p)
    p <= x
    y <= p

