circuit RWProbeInst:
  module Child:
    input x : UInt<5>
    output y : UInt<5>
    y <= x

  module RWProbeInst:
    input x : UInt<5>
    output rw : RWProbe<UInt<5>>[2]

    inst c of Child
    c.x <= x

    define rw[0] = rwprobe(c.x)
    define rw[1] = rwprobe(c.y)

