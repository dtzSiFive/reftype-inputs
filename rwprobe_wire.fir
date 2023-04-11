circuit RWProbeWire:
  extmodule Consumer:
    input in : UInt<5>


  module Producer:
    output out: UInt<5>
    output foo_probe : RWProbe<UInt<5>>
    output n_probe : RWProbe<UInt<5>>
    
    ; Simple constant output.
    node n = UInt<5>(1)
    out <= n

    ; Output port drives internal wire.
    ; Export probe of this.
    wire foo : UInt<5>
    foo <= out
    ; (export RWProbe's instead of writing annotations by hand, not same but works here)
    define foo_probe = rwprobe(foo)
    define n_probe = rwprobe(n)

  module RWProbeWire:
    output keepalive_foo : RWProbe<UInt<5>>
    output keepalive_n : RWProbe<UInt<5>>

    inst c of Consumer
    inst p of Producer

    wire w : UInt<5>
    c.in <= w
    w <= p.out

   force_initial(rwprobe(w), UInt<5>(3))
   define keepalive_foo = p.foo_probe
   define keepalive_n = p.n_probe
