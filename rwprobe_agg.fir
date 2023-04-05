circuit RWProbeAgg:
  module RWProbeAgg:
    input in : { a: UInt<1>, b : UInt<3> }
    output out : RWProbe<{ a : UInt<1>, b : UInt<3> }>
    
    node n = in  
    define out = rwprobe(n)

