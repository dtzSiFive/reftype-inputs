; Child module used by force/release examples

module AddRefs:
  output a : RWProbe<UInt<2>>
  output b : RWProbe<UInt<2>>
  output c : RWProbe<UInt<2>>
  output sum : UInt<3>

  wire w : UInt<2>
  connect w, UInt<2>(0)
  node x = w
  node y = w
  node z = w
  connect sum, add(x, add(y, z))

  define a = rwprobe(x)
  define b = rwprobe(y)
  define c = rwprobe(z)
