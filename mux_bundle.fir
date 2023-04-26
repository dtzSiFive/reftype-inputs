circuit MuxBundle:
  module Child:
    input x : UInt<3>
    input y : UInt<3>
    input c : UInt<1>
    output out : { val : UInt<3>, other : Probe<UInt<3>> }

    out.val <= mux(c,x,y);
    node n = out
    define out.other = n.other
    

  module Muxbundle:
    input x : UInt<3>
    input y : UInt<3>
    input c : UInt<1>
    output val : UInt<3>
    output other:  UInt<3>

    inst child of Child
    child.x <= x
    child.y <= y
    child.c <= c
    
    val <= child.out.val
    other <= read(child.out.other)
