circuit RWProbePort:
  module RWProbePort:
    input in : UInt<1>[2]
    output p : RWProbe<UInt<1>>
    define p = rwprobe(in[1])
