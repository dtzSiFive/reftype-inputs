FIRRTL version 3.0.0

circuit RWProbePortDedup: %[[
{
  "class": "firrtl.transforms.MustDeduplicateAnnotation",
  "modules": ["~RWProbePortDedup|A","~RWProbePortDedup|B"]
}
]]

  module A:
    input x : UInt<5>
    output p : RWProbe<UInt<5>>

    define p = rwprobe(x)

  module B:
    input x : UInt<5>
    output p : RWProbe<UInt<5>>

    define p = rwprobe(x)

  module RWProbePortDedup:
    input x : UInt<5>
    output p_a : RWProbe<UInt<5>>
    output p_b : RWProbe<UInt<5>>

    inst a of A
    connect a.x, x
    define p_a = a.p

    inst b of B
    connect b.x, x
    define p_b = b.p
