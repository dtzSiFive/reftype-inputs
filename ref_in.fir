circuit InRef :
  module UTurn :
    input in : Probe<UInt<1>>
    output out : Probe<UInt<1>>
    define out = in

  module InRef :
    input in : UInt<1>
    output r : Probe<UInt<1>>
    output out : UInt<1>

    inst c of UTurn
    define c.in = probe(in)
    define r = c.out

    out <= read(c.out)


