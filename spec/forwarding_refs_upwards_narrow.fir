circuit Forward :
  extmodule Foo :
    output p : Probe<UInt[2]>[2]
    ; ...

  module Forward :
    output p : Probe<UInt>

    inst f of Foo
    define p = f.p[0][1]
