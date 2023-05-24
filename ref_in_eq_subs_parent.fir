circuit eqsubs:
  module foo:
    input x : Probe<UInt<1>>
    input data : {a: {b: {c: UInt<1>}}}
    output ref : Probe<{a: {b: {c: UInt<1>}}}>
    output out : UInt<1>
    define ref = probe(data)

    node n = read(x)
    out <= n

  module bar:
    input d : UInt<1>
    input a : Probe<{b: {c: UInt<1>}}>
    output ref : Probe<{a: {b: {c: UInt<1>}}}>
    output out : UInt<1>

    inst f of foo
    f.data.a.b.c <= d
    define f.x = a.b.c
    define ref = f.ref
    out <= and(f.out, and(read(f.ref.a.b.c), read(f.ref).a.b.c))

  module baz:
    input d : UInt<1>
    input b : Probe<{c: UInt<1>}>
    output ref : Probe<{a: {b: {c: UInt<1>}}}>
    output out : UInt<1>

    inst f of foo
    f.data.a.b.c <= d
    define f.x = b.c
    define ref = f.ref
    out <= f.out

  module eqsubs:
    input d1 : UInt<1>
    input d2 : UInt<1>
    output out1 : UInt<1>
    output out2 : UInt<1>

    inst x of bar
    inst y of baz
    ; XXX: Check variant where these cross :)
    x.d <= d1
    define x.a = x.ref.a
    y.d <= d2
    define y.b = y.ref.a.b

    out1 <= x.out
    out2 <= y.out
