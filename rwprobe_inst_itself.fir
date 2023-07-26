circuit RWProbeInst:
  module Child:
    input x : UInt<5>[2]
    output y : UInt<5>
    y <= and(x[0], x[1])

  module RWProbeInst:
    input x : UInt<5>[2]
    output rw : RWProbe<{x : UInt<5>[2], y : UInt<5>}>

    inst c of Child
    c.x <= x

    define rw = rwprobe(c) ; (No!)
