circuit UnusedInputRef :
  ; SPEC EXAMPLE BEGIN
  module UnusedInputRef :
    input r : Probe<UInt<1>>
  
  module ForwardDownwards :
    input in : UInt<1>
  
    inst u of UnusedInputRef
    define u.r = probe(in)
  ; SPEC EXAMPLE END
