circuit ResetInferGood :
  module ResetInferGood :
    input in : Reset
    output out : Reset
    output out2 : AsyncReset
    out <= read(probe(in))  
    out2 <= in
    

