circuit ResetInferBad :
  module ResetInferBad :
    input in : Reset
    output out : AsyncReset
    out <= read(probe(in))  
