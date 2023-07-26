circuit RWProbeInst:
  module Child:
    input x : UInt<5>[2]
    output y : UInt<5>
    y <= and(x[0], x[1])

  module RWProbeInst:
    input x : UInt<5>[2]
    output rw : RWProbe<UInt<5>>[3]

    inst c of Child
    c.x <= x

    define rw[0] = rwprobe(c.x[0])
    define rw[1] = rwprobe(c.x[1])
    define rw[2] = rwprobe(c.y)
