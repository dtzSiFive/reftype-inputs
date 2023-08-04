circuit MyModule :
  module MyModule :
    input in: UInt<5>
    output r : Probe<UInt>

    define r = probe(in)

