circuit ForceAndRelease:
  module ForceAndRelease:
    input a: UInt<2>
    input clock : Clock
    input cond : UInt<1>
    output o : UInt<3>

    inst r of AddRefs
    o <= r.sum

    force(clock, cond, r.a, a)
    release(clock, not(cond), r.a)
  
  ; include "force_addrefs.fir"
  module AddRefs:
    output a : RWProbe<UInt<2>>
    output b : RWProbe<UInt<2>>
    output c : RWProbe<UInt<2>>
    output sum : UInt<3>

    wire w : UInt<2>
    w <= UInt<2>(0)
    node x = w
    node y = w
    node z = w
    sum <= add(x, add(y, z))

    define a = rwprobe(x)
    define b = rwprobe(y)
    define c = rwprobe(z)
