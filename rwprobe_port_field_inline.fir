FIRRTL version 3.1.0

; Run with -preserve-aggregate=all

circuit RWProbePort: %[[
  {
    "class": "firrtl.passes.InlineAnnotation",
    "target": "~RWProbePort|Child"
  }
]]

  module Child:
    input in : UInt<1>[2]
    output p : RWProbe<UInt<1>>
    define p = rwprobe(in[1])

  module RWProbePort:
    input in : UInt<1>[2]
    output p : RWProbe<UInt<1>>[2]
    inst c1 of Child
    inst c2 of Child
    
    connect c1.in, in
    connect c2.in, in
    define p[0] = c1.p
    define p[1] = c2.p
