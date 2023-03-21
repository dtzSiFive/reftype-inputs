circuit Top :
  module Top:
    input x : {a: UInt, flip b: UInt}
    output y : {a: UInt, flip b: UInt}

    inst d of DUT
    d.x <= x
    y <= d.y

    wire val : {a: UInt<2>, b: UInt<2>}
    val.a <= UInt<2>(1)
    val.b <= UInt<2>(2)

    ; Force takes a RWProbe and overrides the target with 'val'.
    force_initial(d.xp, val)

  module DUT :
    input x : {a: UInt, flip b: UInt}
    output y : {a: UInt, flip b: UInt}
    output xp : RWProbe<{a: UInt, b: UInt}>

    ; Force drives p.a, p.b, y.a, and x.b, but not y.b and x.a
    wire p : {a: UInt, flip b: UInt}
    define xp = rwprobe(p)
    p <= x
    y <= p

