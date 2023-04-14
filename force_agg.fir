circuit Top :
  module Top:
    input x : {a: UInt<2>, b: UInt<2>[3]}
    output y : {a: UInt<2>, b: UInt<2>[3]}

    inst d of DUT
    d.x <= x
    y <= d.y

    wire val : {a: UInt<2>, b: UInt<2>[3]}
    val.a <= UInt<2>(1)
    val.b[0] <= UInt<2>(0)
    val.b[1] <= UInt<2>(1)
    val.b[2] <= UInt<2>(2)

    ; Force takes a RWProbe and overrides the target with 'val'.
    force_initial(d.xp, val)

  module DUT :
    input x : {a: UInt<2>, b: UInt<2>[3]}
    output y : {a: UInt<2>, b: UInt<2>[3]}
    output xp : RWProbe<{a: UInt<2>, b: UInt<2>[3]}>

    wire p : {a: UInt<2>, b: UInt<2>[3]}
    define xp = rwprobe(p)
    p <= x
    y <= p

