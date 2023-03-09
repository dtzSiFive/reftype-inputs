circuit MinimumWidth :
  module Uninferred :
    input x : UInt
    output r : Probe<UInt>
    define r = probe(x)
  
  module MinimumWidth :
    input x : UInt<4>
    output y : UInt
  
    inst u of Uninferred
    u.x <= x
    y <= read(u.r)
  
