circuit Foo:
  module Foo:
    output p: Probe<UInt<1>>
    node n = UInt<1>(1)
    define p = probe(n)
