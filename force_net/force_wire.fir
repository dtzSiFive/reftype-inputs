circuit Force: %[[
 { "class": "firrtl.transforms.DontTouchAnnotation",
   "target": "~Force|Force>x" },
 { "class": "firrtl.transforms.DontTouchAnnotation",
   "target": "~Force|Force>y" }
]]
  module Force:
    input in : UInt<5>
    input clock: Clock

    node x = in;
    node y = x;

    assert(clock, neq(x, UInt<5>(3)), UInt<1>(1), "x was changed by forcing y")

    force_initial(rwprobe(y), UInt<5>(3))
