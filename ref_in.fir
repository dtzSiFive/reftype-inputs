circuit InRef :
  module UTurn :
    input in : Probe<UInt<1>>
    output out : Probe<UInt<1>>
    forward in as out

  module InRef :
    input in : UInt<1>
    output r : Probe<UInt<1>>
    output out : UInt<1>

    inst c of UTurn
    ; export probe(c.r) as c.in
    export in as c.in
    forward c.out as r

    out <= read(c.out)


