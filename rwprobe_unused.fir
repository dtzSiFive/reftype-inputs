circuit RWProbeUnused:
  module Child:
    input in : UInt<4>
    output rw : RWProbe<UInt<4>>

    node n = in
    define rw = rwprobe(n)

  module RWProbeUnused:
     input in : UInt<4>

     inst c of Child
     c.in <= in
