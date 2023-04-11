circuit ForceRead:
  module Child:
    input x : UInt<5>
    output x_ref : Probe<UInt<5>>
    output w_ref : RWProbe<UInt<5>>
    output out : UInt<5>

    wire w : UInt<5>
    w is invalid
    out <= w

    define x_ref = probe(x)
    define w_ref = rwprobe(w)

  module ForceRead:
    input x : UInt<5>
    input clock: Clock
    input activateForce: UInt<1>
    output out : UInt

    inst c of Child
    c.x <= x
    out <= c.out

    force_initial(c.w_ref, UInt<5>(0))
    force(clock, activateForce, c.w_ref, read(c.x_ref));
    release(clock, not(activateForce), c.w_ref)
