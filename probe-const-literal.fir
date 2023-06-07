circuit Foo:
  module Foo:
    input x : const {a: UInt<1>, b: UInt<3>}
    output p: Probe<{a: UInt, b: const UInt<3>}>
    output y : {a: UInt, b: const UInt}
    node n = x
    define p = probe(n)

    y <= read(p)
