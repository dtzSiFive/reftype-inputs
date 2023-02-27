extmodule RefExt :
  input in : UInt<1>
  output r : Probe<UInt<1>>
  output bundle : { a : UInt<1> , b : Probe<UInt<1>> }
  output vector : Probe<UInt<1>>[2]
  ; Resolve references
  ref r = in
  ref bundle.b = foo.bar
  ref vector[0] = x.y
  ref vector[1] = x.y


