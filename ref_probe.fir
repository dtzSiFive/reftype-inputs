circuit Probe :
  module Probe :
    input in : UInt<1>
    output r : Probe<UInt<1>>

    export probe(in) as r

