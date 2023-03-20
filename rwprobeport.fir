;// -----

circuit RWProbePort:
  module RWProbePort:
    input in : UInt<1>
    output out : RWProbe<UInt<1>>

    define out = rwprobe(in) ; expected-error {{cannot obtain a rwprobe of a port}}


