circuit RWProbeWire: %[[
 { "class": "firrtl.transforms.DontTouchAnnotation",
   "target": "~RWProbeWire|Producer>out" }
]]
  module Consumer:
    input in : UInt<5>
    output in_ref : RWProbe<UInt<5>>

    define in_ref = rwprobe(in)


  module Producer:
    input clock: Clock
    output out: UInt<5>
    
    ; Simple constant output.
    out <= UInt<5>(1)

    assert(clock, eq(out, UInt<5>(1)), UInt<1>(1), "out was changed")


  module RWProbeWire:
    input clock: Clock

    inst c of Consumer
    inst p of Producer

    c.in <= p.out
    p.clock <= clock

   force_initial(c.in_ref, UInt<5>(3))

