circuit Top:
  module Consumer:
    input in : {a: UInt, pref: Probe<UInt>, flip cref: Probe<UInt>}
    ; ...
    node n = in.a
    define in.cref = probe(n)

  module Producer:
    output out : {a: UInt, pref: Probe<UInt>, flip cref: Probe<UInt>}
    wire x : UInt
    define out.pref = probe(x)
    ; ...
    x <= UInt(3)
    out.a <= x

  module Connect:
    output out : {pref : Probe<UInt>, cref : Probe<UInt>}

    inst a of Consumer ; A
    inst b of Producer ; B

    ; A => B
    a.in.a <= b.out.a
    define a.in.pref = b.out.pref
    define b.out.cref = a.in.cref

    ; Send references out
    define out.pref = b.out.pref
    define out.cref = a.in.cref

  module Top:
    output pdebug : UInt
    output cdebug : UInt

    inst c of Connect

    pdebug <= read(c.out.pref);
    cdebug <= read(c.out.cref);
