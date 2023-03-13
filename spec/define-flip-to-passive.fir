circuit Foo :
  module Foo :
    input x : {a: UInt, flip b: UInt}
    output y : {a: UInt, flip b: UInt}
    output xp : Probe<{a: UInt, b: UInt}> ; passive
  
    wire p : {a: UInt, flip b: UInt} ; p is not passive
    define xp = probe(p)
    p <= x
    y <= p

