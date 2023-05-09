circuit InRef :
  module UTurn :
    input in : Probe<UInt<1>>
    output out : Probe<UInt<1>>
    define out = in

  module UTurnWrapper :
    input in : Probe<UInt<1>>
    output out : Probe<UInt<1>>
    inst u of UTurn
    define u.in = in
    define out = u.out

  module InRef :
    input in : UInt<1>
    output r : Probe<UInt<1>>
    output out : UInt<1>

    inst c of UTurn
    define c.in = probe(in)

    inst c2 of UTurnWrapper
    define c2.in = c.out
    define r = c2.out

    out <= read(c2.out)


