circuit RWProbePort:
  module RWProbePort:
    input in : UInt<1>[2]
    output p : RWProbe<UInt>

    inst c of Child
    c.in <= in
    define p = c.p

  module Child:
    input in : UInt[2]
    output p : RWProbe<UInt>
    define p = rwprobe(in[1])

