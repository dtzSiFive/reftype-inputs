circuit eq:
  module foo:
    input x : Probe<UInt<1>>
    input data : UInt<1>
    output a : Probe<UInt<1>>
    output b : Probe<UInt<1>>
    output out : UInt<1>
    define a = probe(data)
    define b = probe(data)
    node n = read(x)
    out <= n

  module eq:
    input d1 : UInt<1>
    input d2 : UInt<1>
    output out1 : UInt<1>
    output out2 : UInt<1>

    inst f1 of foo
    inst f2 of foo
    f1.data <= d1
    f2.data <= d2
    define f1.x = f1.a
    define f2.x = f2.b

    out1 <= f1.out
    out2 <= f2.out
