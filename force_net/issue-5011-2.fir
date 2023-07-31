circuit Producer : %[[
 { "class": "firrtl.transforms.DontTouchAnnotation",
   "target": "~Producer|Producer>out" }
]]
  module Producer:
    input clock: Clock
    output out: UInt<5>

    ; Simple constant output.
    out <= UInt<5>(1)

    assert(clock, eq(out, UInt<5>(1)), UInt<1>(1), "out was changed")
