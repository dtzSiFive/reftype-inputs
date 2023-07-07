circuit RWProbe_field:
  module RWProbe_field:
    input x : { a : UInt<1> }[2]
    output rw : RWProbe<{a : UInt<1>}>
    node n = x
    define rw = rwprobe(n[0])
