circuit Foo :
  module Foo :
    output p : Probe<{a: UInt, b: UInt}>
    ; ...
   wire x : {a: UInt<5>, b: UInt<2>} ; XXX: ADDED
   x is invalid ; XXX: ADDED
   define p = probe(x) ; XXX: ADDED

  module Bar :
    output x : UInt

    inst f of Foo
    x <= read(f.p.b) ; indirectly access the probed data

    ; SPEC EXAMPLE BEGIN
    x <= add(read(f.p).a, read(f.p.b))
    ; SPEC EXAMPLE END
