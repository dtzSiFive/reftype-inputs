circuit RWProbeInstancePort:
  extmodule Foo:
    input in : UInt<1>

  module RWProbeInstancePort:
    output out : RWProbe<UInt<1>>

    inst f of Foo
    f.in <= UInt(0)
    define out = rwprobe(f.in)
