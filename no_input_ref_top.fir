;// -----

circuit InProbeTop:
  module InProbeTop:
    input p : Probe<UInt<1>> ; expected-error {{cannot have probes as inputs to top module}}

