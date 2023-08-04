circuit Forward:
  extmodule Foo :
    output p : Probe<UInt<3>>
    ; ...

  module Forward :
    output p : Probe<UInt>

    inst f of Foo
    define p = f.p
