FIRRTL version 3.0.0

circuit ProbePortDedup: %[[
{
  "class": "firrtl.transforms.MustDeduplicateAnnotation",
  "modules": ["~ProbePortDedup|A","~ProbePortDedup|B"]
}
]]

  module A:
    input x : UInt<5>
    output p : Probe<UInt<5>>

    define p = probe(x)

  module B:
    input x : UInt<5>
    output p : Probe<UInt<5>>

    define p = probe(x)

  module ProbePortDedup:
    input x : UInt<5>
    output p_a : Probe<UInt<5>>
    output p_b : Probe<UInt<5>>

    inst a of A
    connect a.x, x
    define p_a = a.p

    inst b of B
    connect b.x, x
    define p_b = b.p
