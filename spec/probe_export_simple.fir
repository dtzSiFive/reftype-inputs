circuit MyModule :
  module MyModule :
    input in: UInt
    output r : Probe<UInt>

    define r = probe(in)

