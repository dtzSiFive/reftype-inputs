circuit RefSubaccess:
  module RefSubaccess:
    input in : UInt<1>[3]
    input sel : UInt<2>
    output out : UInt<1>

    out <= read(probe(in[sel]))
