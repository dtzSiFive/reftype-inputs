FIRRTL version 3.0.0
circuit FooUser:
  ; Invalid
  ; SPEC EXAMPLE BEGIN
  module Foo:
     input in : Probe<UInt>
     output out : UInt

     connect out, read(in)
  ; SPEC EXAMPLE END
  module FooUser:
    output out : UInt

    node n = UInt<2>(1)
    inst f of Foo
    connect f.in, probe(n)
    connect out, f.out
