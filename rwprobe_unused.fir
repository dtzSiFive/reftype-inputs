circuit RWProbeUnused:
  module Child:
    input in : UInt<4>
    input clk : Clock
    output n_rw : RWProbe<UInt<4>>
    output w_rw : RWProbe<UInt>
    output r_rw : RWProbe<UInt>

    node n = in
    define n_rw = rwprobe(n)
  
    wire w : UInt
    w <= in
    define w_rw = rwprobe(w)

    reg r : UInt, clk
    r <= in
    define r_rw = rwprobe(r)

  module RWProbeUnused:
     input in : UInt<4>
     input clk : Clock

     inst c of Child
     c.in <= in
     c.clk <= clk
