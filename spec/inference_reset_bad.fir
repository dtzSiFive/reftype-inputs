FIRRTL version 3.0.0
circuit ResetInferBad :
  ; SPEC EXAMPLE BEGIN
  module ResetInferBad :
    input in : Reset
    output out : AsyncReset
    connect out, read(probe(in))  
  ; SPEC EXAMPLE END
