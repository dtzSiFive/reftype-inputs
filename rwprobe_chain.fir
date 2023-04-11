circuit RWProbeChain:
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

  module RWProbeChain:
     input in : UInt<4>
     input clk : Clock
     input pred : UInt<1>

     inst c of Child
     c.in <= in
     c.clk <= clk

     force(clk, pred, c.n_rw, and(in,UInt<4>(1)))
     force(clk, pred, c.w_rw, or(in,UInt(1)))
     force(clk, pred, c.r_rw, xor(in,UInt(1)))
