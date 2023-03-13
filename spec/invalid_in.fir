module Foo:
   input in : Probe<UInt>
   output out : UInt

   out <= read(in)

