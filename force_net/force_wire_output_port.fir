circuit Force: %[[
 { "class": "firrtl.transforms.DontTouchAnnotation",
   "target": "~Force|Dummy>n" }
]]
  module Dummy:
    output out : UInt<5>
    node n = UInt<5>(0)
    out <= n
  module Force:
    input clock: Clock

    inst d of Dummy
    node n = d.out
    node o = d.out

    assert(clock, neq(o, UInt<5>(3)), UInt<1>(1), "o was changed by forcing n")

    force_initial(rwprobe(n), UInt<5>(3))
