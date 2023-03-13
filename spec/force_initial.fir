circuit ForceAndRelease:
  module ForceAndRelease:
    output o : UInt<3>
  
    inst r of AddRefs
    o <= r.sum
  
    force_initial(r.a, 0)
    force_initial(r.a, 1)
    force_initial(r.b, 2)
    force_initial(r.c, 3)
    release_initial(r.c)
  
; include "force_addrefs.fir"
module AddRefs:
  output a : RWProbe<UInt<2>>
  output b : RWProbe<UInt<2>>
  output c : RWProbe<UInt<2>>
  output sum : UInt<3>

  node x = Uint<2>(0)
  node y : UInt<2>(0)
  node z : UInt<2>(0)
  sum <= add(x, add(y, z))

  define a = rwprobe(x)
  define b = rwprobe(y)
  define c = rwprobe(z)
