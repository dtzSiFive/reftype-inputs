module UTurn:
  input in : Probe<UInt>
  output out : Probe<UInt>
  define out = in

module RefBouncing:
  input x: UInt
  output y: UInt

  inst u1 of UTurn
  inst u2 of UTurn

  node n = x
  define u1.in = probe(n)
  define u2.in = u1.out

  out <= read(u2.out) ; = x

