FIRRTL version 3.1.0

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
    output p : RWProbe<UInt<1>>
    inst c of Child
    
    connect c.in, in
    define p = c.p
