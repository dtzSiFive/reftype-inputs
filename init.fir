circuit Init :
  module Init :
    input x : UInt<1>
    output y : Probe<UInt<1>>

    define y = probe(x)
    define y = probe(x)
