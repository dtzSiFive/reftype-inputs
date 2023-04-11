circuit RWProbeChain:
  module Child:
    input in : UInt<4>
    input clk : Clock
    output n_rw : RWProbe<UInt<4>>
    output w_rw : RWProbe<UInt>
    output r_rw : RWProbe<UInt>
    output out : UInt

    node n = in
  
    wire w : UInt
    w <= n

    reg r : UInt, clk
    r <= w

    define n_rw = rwprobe(n)
    define w_rw = rwprobe(w)
    define r_rw = rwprobe(r)
    
    out <= r

  module A:
    input in : UInt<4>
     input clk : Clock
    output n_rw : RWProbe<UInt<4>>
    output w_rw : RWProbe<UInt>
    output r_rw : RWProbe<UInt>
    output out : UInt

    inst instanceOfChild of Child
    define n_rw = instanceOfChild.n_rw
    define w_rw = instanceOfChild.w_rw
    define r_rw = instanceOfChild.r_rw
    instanceOfChild.in <= in
    instanceOfChild.clk <= clk
    out <= instanceOfChild.out

  module B:
    input in : UInt<4>
     input clk : Clock
    output n_rw : RWProbe<UInt<4>>
    output w_rw : RWProbe<UInt>
    output r_rw : RWProbe<UInt>
    output out : UInt

    inst instanceOfAThatContainsChild of A
    define n_rw = instanceOfAThatContainsChild.n_rw
    define w_rw = instanceOfAThatContainsChild.w_rw
    define r_rw = instanceOfAThatContainsChild.r_rw
    instanceOfAThatContainsChild.in <= in
    instanceOfAThatContainsChild.clk <= clk
    out <= instanceOfAThatContainsChild.out

  module RWProbeChain:
     input in : UInt<4>
     input clk : Clock
     input pred : UInt<1>
     output out : UInt

     inst instanceOfBThatContainsA of B
     instanceOfBThatContainsA.in <= in
     instanceOfBThatContainsA.clk <= clk
     out <= instanceOfBThatContainsA.out

     force_initial(instanceOfBThatContainsA.n_rw, and(in,UInt<4>(1)))
     when pred:
       force(clk, pred, instanceOfBThatContainsA.r_rw, xor(in, UInt(2)))
     else:
       force(clk, UInt<1>(1), instanceOfBThatContainsA.w_rw, and(in,UInt(1)))

