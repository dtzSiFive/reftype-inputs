; INVALID, no rwprobe of const
circuit RWProbeConst:
  module RWProbeConst:
    input x : const UInt<2>
    output y : RWProbe<const UInt<2>> ; reject here
    node n = x
    define y = rwprobe(n)  ; also here
