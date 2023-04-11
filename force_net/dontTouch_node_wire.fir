circuit Producer : %[[
 { "class": "firrtl.transforms.DontTouchAnnotation",
   "target": "~Producer|Producer>out" },
 { "class": "firrtl.transforms.DontTouchAnnotation",
   "target": "~Producer|Producer>n" }
]]
  module Producer:
    input clock: Clock
    wire out: UInt<5>

    ; Simple constant output.
    node n = UInt<5>(1)
    out <= n

    assert(clock, neq(out, UInt<5>(3)), UInt<1>(1), "out was changed")
