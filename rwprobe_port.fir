;// -----

circuit RWProbePort:
  module RWProbePort:
    output out : RWProbe<UInt<1>> ; expected-error {{rwprobe port nope}}

    ; rwprobe(out)
    ; rwprobe(instance.in)
    ; etc.

