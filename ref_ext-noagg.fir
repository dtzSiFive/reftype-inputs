circuit UseRefExt :
  module UseRefExt :
    input in : UInt<1>
    output out : UInt

    inst e of RefExt
    e.in <= in
    out <= read(e.r)

  extmodule RefExt :
    input in : UInt<1>
    output r : Probe<UInt<1>>
    ; output bundle : { a : UInt<1> , b : Probe<UInt<1>> }
    ; output vector : Probe<UInt<1>>[2]
    ; Resolve references
    ref r is "in"
    ; ref r is "out" ; duplicate
    ; ref r2 is "in" ; unused
    ;ref bundle.b is "foo.bar"
    ;ref vector[0] is "x.y"
    ;ref vector[1] is "x.y"
