circuit RWProbeUnused:
  module Child:
    input in : UInt<4>
    input clk : Clock
    output n_rw : RWProbe<UInt<4>>
    output w_rw : RWProbe<UInt>
    output r_rw : RWProbe<UInt>

    node n = in
  
    wire w : UInt
    w <= n

    reg r : UInt, clk
    r <= w

    define n_rw = rwprobe(n)
    define w_rw = rwprobe(w)
    define r_rw = rwprobe(r)

  module RWProbeUnused:
     input in : UInt<4>
     input clk : Clock

     inst c of Child
     c.in <= in
     c.clk <= clk
