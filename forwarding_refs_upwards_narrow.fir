circuit Forward:
  module Foo :
    output p : Probe<UInt<2>[2]>
    wire x : UInt<2>[2]
    x is invalid
    define p = probe(x)
  
  module Forward :
    output p : Probe<UInt<2>>
    output data : UInt
    output data2 : UInt
  
    inst f of Foo
    define p = f.p[0]
    data <= read(p)
    data2 <= read(f.p[1])

