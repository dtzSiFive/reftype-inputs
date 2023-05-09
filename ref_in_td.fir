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

  module Test :
    input x : UInt<1>
    input in : Probe<UInt<1>>
    output out : Probe<UInt<1>>
    output y : UInt<1>
    
    ; Send ref up and around
    define out = probe(x)
    ; Consume that same ref after its voyage.
    y <= read(in)

  module InRef :
    input in : UInt<1>
    output out : UInt<1>

    inst test of Test
    test.x <= in
    out <= test.y

    inst c of UTurn
    define c.in = test.out

    inst c2 of UTurnWrapper
    define c2.in = c.out
    define test.in = c2.out



