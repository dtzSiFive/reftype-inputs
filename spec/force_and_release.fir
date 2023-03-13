circuit ForceAndRelease:
  module ForceAndRelease:
    input a: UInt<2>
    input clock : Clock
    input cond : UInt<1>
    output o : UInt<3>

    inst r of AddRefs
    o <= r.sum

    force(clock, c, r.a, a)
    release(clock, not(c), r.a)
  
  ; include "force_addrefs.fir"
  module AddRefs:
    output a : RWProbe<UInt<2>>
    output b : RWProbe<UInt<2>>
    output c : RWProbe<UInt<2>>
    output sum : UInt<3>

    node x = UInt<2>(0)
    node y = UInt<2>(0)
    node z = UInt<2>(0)
    sum <= add(x, add(y, z))

    define a = rwprobe(x)
    define b = rwprobe(y)
    define c = rwprobe(z)
