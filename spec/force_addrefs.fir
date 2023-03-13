; Child module used by force/release examples

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
