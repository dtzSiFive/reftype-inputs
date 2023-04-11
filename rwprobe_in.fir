circuit RWProbeWire: %[[
 { "class": "firrtl.transforms.DontTouchAnnotation",
   "target": "~RWProbeWire|Producer>out" }
]]
  module Consumer:
    input in : UInt<5>
    output n_ref : RWProbe<UInt<5>>

    node n = in
    define n_ref = rwprobe(n)


  module Producer:
    output out: UInt<5>
    
    ; Simple constant output.
    out <= UInt<5>(1)


  module RWProbeWire:
    input clock: Clock
    inst c of Consumer
    inst p of Producer

    wire w : UInt<5>
    c.in <= w
    w <= p.out
    assert(clock, neq(w, UInt<5>(3)), UInt<1>(1), "out was changed")


   force_initial(c.n_ref, UInt<5>(3))

