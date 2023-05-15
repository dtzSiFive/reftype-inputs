circuit eqsubs:
  module foo:
    input x : Probe<UInt<1>>
    input data : {a: {b: {c: UInt<1>}}}
    output a : Probe<{b: {c: UInt<1>}}>
    output b : Probe<{c: UInt<1>}>
    output dummy : Probe<{a: {b: {c: UInt<1>}}}>
    define dummy = probe(data)

    define a = dummy.a
    define b = dummy.a.b

    node n = read(x)

  module eqsubs:
    input d1 : UInt<1>
    input d2 : UInt<1>

    inst f1 of foo
    inst f2 of foo
    f1.data.a.b.c <= d1
    f2.data.a.b.c <= d2
    define f1.x = f1.a.b.c
    define f2.x = f2.b.c

