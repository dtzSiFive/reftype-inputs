circuit RWProbeWire: %[[
 { "class": "firrtl.transforms.DontTouchAnnotation",
   "target": "~RWProbeWire|Producer>out" },
 { "class": "firrtl.transforms.DontTouchAnnotation",
   "target": "~RWProbeWire|Producer>n" }
]]
  extmodule Consumer:
    input in : UInt<5>


  module Producer:
    input clock: Clock
    output out: UInt<5>
    
    ; Simple constant output.
    node n = UInt<5>(1)
    out <= n

    assert(clock, neq(out, UInt<5>(3)), UInt<1>(1), "out was changed")

  module RWProbeWire:
    input clock: Clock
    inst c of Consumer
    inst p of Producer

    wire w : UInt<5>
    c.in <= w
    p.clock <= clock
    w <= p.out

   force_initial(rwprobe(w), UInt<5>(3))
